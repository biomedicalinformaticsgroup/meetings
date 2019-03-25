
```bash
ssh -Y xhe@nrg.inf.ed.ac.uk

# 172.17.0.1
sudo ip addr show docker0

~/tmp/gephi-0.9.2/bin/gephi

lsof -i :8080

MATCH path = (:Person)-[:KNOWS]->(:Person)
CALL apoc.gephi.add('172.17.0.1:8080','ws1',path,'weight') yield nodes
return * limit 10


```


