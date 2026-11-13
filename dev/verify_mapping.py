import json,urllib.request,urllib.parse,concurrent.futures,pathlib,datetime
base='https://echodata.epa.gov/echo/'
rows=[]
def request(path,params,post=False):
 data=urllib.parse.urlencode(dict(output='JSON',**params)).encode()
 req=urllib.request.Request(base+path+('' if post else '?'+data.decode()),data=data if post else None,headers={'Content-Type':'application/x-www-form-urlencoded'})
 with urllib.request.urlopen(req,timeout=25) as r: return json.loads(r.read())
def record(label,path,params,post=False):
 try:
  p=request(path,params,post); root=p.get('Results',p); m=root.get('MapOutput',{});data=m.get('MapData',[])
  result=dict(check=label,method='POST' if post else 'GET',path=path,rows=len(data) if isinstance(data,list) else None,facility_rows=len(m.get('MapDataFacilities',[]) or []),message=root.get('Message'),error=root.get('Error'),keys=list(root),types=sorted(set(str(x.get('TYPE')) for x in data if isinstance(x,dict))))
  if 'SpatialMetadata' in root: result['spatial_metadata']=root['SpatialMetadata']
  signature=sorted(json.dumps(x,sort_keys=True) for x in data) if isinstance(data,list) else []
  result['record_hash']=__import__('hashlib').sha256('\n'.join(signature).encode()).hexdigest()
  return result
 except Exception as e:return dict(check=label,method='POST' if post else 'GET',path=path,failure=str(e))
jobs=[]
for service,search,params in [('cwa','get_facilities',dict(p_st='RI',p_maj='Y')),('ecatt_ams','get_facilities',dict(p_st='RI')),('case','get_cases',dict(p_state='RI'))]:
 ns=service+'_rest_services.'
 try:
  p=request(ns+search,params); qid=p['Results']['QueryID']
  variations=[('qid-only',{}),('bbox',dict(c1_lat=41,c1_long=-72,c2_lat=42.1,c2_long=-71)),('tablelist',dict(tablelist='Y'))]
  if service=='ecatt_ams':variations.append(('xmin',dict(xmin=-72,ymin=41,xmax=-71,ymax=42.1)))
  if service=='case':variations.extend([('mapset-1',dict(mapset='1')),('mapset-10',dict(mapset='10'))])
  for label,args in variations:
   for post in [False,True]:jobs.append((service+'-'+label,ns+'get_map',dict(qid=qid,**args),post))
 except Exception as e:rows.append(dict(check=service+'-search',failure=str(e)))
for ns,method,params in [('dfr','get_map',dict(p_id='110000381989')),('dfr','get_spatial_metadata',dict(p_id='110000381989')),('caa_poll_rpt','get_map',dict(p_id='110000381989')),('caa_poll_rpt','get_spatial_metadata',dict(p_id='110000381989')),('ecatt_ams','get_rpt_map',dict(p_site_code='440070022')),('ecatt_aqs','get_rpt_map',dict(p_site_code='440070022',p_map_facs='N'))]:
 for post in [False,True]:jobs.append((ns+'-'+method,ns+'_rest_services.'+method,params,post))
jobs.append(('unknown-qid','cwa_rest_services.get_map',dict(qid='999999999999999'),False))
with concurrent.futures.ThreadPoolExecutor(max_workers=3) as ex:rows+=list(ex.map(lambda job:record(*job),jobs))
path=pathlib.Path('dev/mapping-verification.json');path.write_text(json.dumps(dict(retrieved=datetime.datetime.now(datetime.timezone.utc).isoformat(),checks=rows),indent=2)+'\n')
print(json.dumps(rows,indent=2)[:4000])
