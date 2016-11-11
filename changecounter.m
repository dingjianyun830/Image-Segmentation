function bdry1 = changecounter(bdry)
bdry1 = bdry;
AAA=find(bdry==1);
BBB=find(bdry==0);
bdry1(AAA)=0;
bdry1(BBB)=1;