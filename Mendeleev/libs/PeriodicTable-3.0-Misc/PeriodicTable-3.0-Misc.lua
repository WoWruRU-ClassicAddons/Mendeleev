-- (c) 2007 Nymbia.  see LGPLv2.1.txt for full details.
--DO NOT MAKE CHANGES TO THIS FILE BEFORE READING THE WIKI PAGE REGARDING CHANGING THESE FILES
-- Note: this module not LoD because no similarities can be drawn between the sets.
if not AceLibrary:HasInstance("PeriodicTable-3.0") then error("PT3 must be loaded before data") end
AceLibrary("PeriodicTable-3.0"):AddData("Misc", "$Rev: 44894 $", {
	["Bag.Basic"]="ax8:i,lcw:i,fd6:i,gvo:k,hhz:i,8gf:g,nq0:e,gur:i,ax7:g,gup:g,iek:8,dv2:i,fqo:g,3h0:g,926:g,4g5:a,ns:8,3gy:8,2kv:8,hez:6,evv:e,pi:a,i1p:4,8qk:e,pw:a,2ht:8,4at:8,4g4:a,39t:8,1c1:a,951:4,3gx:a,3gz:c,57o:6,30q:e,3x5:6,mc:a,4aw:a,4av:a,1bx:c,nt:a,px:a,39q:6,7r6:c,hq8:4,14u:a,16p:4,3tp:6,2l4:a,21t:8,4g2:6,7r7:c,4g3:8,au6:e,4ar:6,n0:6,3gw:6,4as:6,md:6,39x:a,4z2:a,19w:c,fsq:4,7eb:e,1at:e,4au:8,1lu:6,39s:8",
	["Bag.Special.Ammo"]="ewo:g,mgu:i,2s4:c,5os:e,21z:g,6ca:g,2ra:a,8rn:a,1me:6,5m7:8,475:8",
	["Bag.Special.Enchanting"]="gv6:s,h61:o,h5y:g,h60:k,nq4:k",
	["Bag.Special.Engineering"]="ice:o,nq1:k",
	["Bag.Special.Herb"]="h63:k,h62:c,h64:o",
	["Bag.Special.Jewelcrafting"]="iq6:o,nq3:k",
	["Bag.Special.Mining"]="nq2:k,msk:s",
	["Bag.Special.Quiver"]="efu:i,mhj:i,ewn:g,mhk:i,5or:e,6c9:g,2s5:c,21y:g,2r9:a,5m6:8,1md:6,8rm:a,473:8",
	["Bag.Special.Soul Shard"]="ggu:s,gvk:s,ggt:o,h5w:g,h5v:c,ggs:k",

	["Container.ItemsInType.Soul Shard"]="4u1",
	["Container.ItemsInType.Herb"]="f7z,ae4,f7y,hl2,6tg,d58,6tj,h1q,hiu,i4t,1w2,1w5,adz,hky,1w1,ci8,i01,2y2,hl7,8vu,hl6,hkx,3kh,hl0,h37,ci5,6tp,iph,ae0,2y5,2ll,12x,6tq,d59,ae3,o5g,d5a,2la,2l8,2l9,lt,hl5,d56,8io,ae1,hl3,p1w,980,hl9,hl4,8i6,1vz,ae2,6tb,hkz,3wg,ipi,dpc,l9,2y4,d57,6ti,1w4,hl1,e49,3zk,ics,itt,97z,2l7,6ah,2y3",
	["Container.ItemsInType.Enchanting"]="fzp,hbm,ltk,ltj,g00,ltg,lth,fzy,fzz,fzt,fzs,fzu,fzr,fzv,fzq,e38,cji,hen,hep,e37,heo,b2g,8jw,8lf,hbl,8mi,hbz,b2f,8gy,8le,hbk,8mh,8im,hek,cjd,cjj,hei,cjb,he8,he7,cj9,cif,8m7,4x5,cik,he9,he6,8nr,hdx,cie,8n8,8nt,8m3,4x3,8kd,hdu,4w8,4wb,hdw,hdy,cii,cjf,cja,cjh,4wa,cj6,lta,4w6,cig,8na,8ka,hec,8in,lte,8n9,8n7,8ls,cij,cj8,8lr,ltd,ltc,8lq,8nu,8m6,ltb,8ns,8m8,8jt,he5,he4,8n6,cim,hel,cjg,8nc,8nb,cin,8m4,8m5,ltl,hef,hej,4wc,heh,hem,cje,cjc,dod,945,8ju,ci3,8fv,8lb,8mf,hbi,8hi,ci2,8fu,8la,8me,hbj,hby,hbh,8mg,g0l,g0k,ha0,4wd,f07,f06,iio,hdv,iir,heb,cil,fzw,fzx,cio,he1,he0,he2,hdz,cih,he3,ltm,f05,heg,f09,f08,f04,het,g0i,g0h,g0g,g0m,jy0,cj7,jy1,heq,her,g0j,ci4,ci7,4sq,hbx,8l6,4w3,8ll,8jv,8fw,8ld",
	["Container.ItemsInType.Engineering"]="p26,p2m,ie6,ie7,p1p,p24,idx,idw,p20,p23,p28,p2n,p22,p21,p27,cd2,e3v,ffj,ffi,iby,ie3,ie4,83s,edm,edq,ic3,ic5,idt,ic1,ids,e42,e44,3en,id4,e43,iff,ida,idc,ifg,id6,id8,ifj,86o,86l,idd,ic6,edr,ic2,ic4,83n,83p,3e1,ido,83u,nke,enc,83o,3dc,84x,89t,89y,89w,5si,84v,84u,5jp,864,3dt,edp,cco,3dp,846,83r,cdz,cdy,86h,86j,grt,ide,cdt,cds,3el,56k,gru,3ej,55c,ce0,ee6,ee5,3eo,ee9,3ep,cdo,ee7,cdx,3eg,86k,3ek,86m,3em,jz3,3ei,3eh,do8,cdp,cdn,cdv,eea,cdw,eed,3dh,83q,ccf,ene,nkg,ccp,eec,3ef,ico,ibd,3e0,cdk,4sr,ofm,3do,3e2,76o,gn7,3dq,3df,3d8,3d9,3dz,3d7,3d5,ic7,3ed,ccl,84y,ccm,cc8,edt,3dw,icl,idn,3ds,56i,ecc,ibc,icm,icr,e2g,3dk,3qs,mm,p0d,5jr,8bq,edx,89x,3e5,87p,ie9,89s,89o,863,89z,8br,5ik,ecb,3e3,85t,861,6zp,87q,85a,76p,gna,icb,3dx,83m,3d3,icn,icp,idq,3dl,3dm,85e,3du,p0n,6zo,3dy,3dv,icq,gnp,gr6,3de,gnq,gr8,gns,gra,3e6,ccc,94i,idr,cd3,3e4,8xy,3e9,85d,842,85s,85b,48z,94h,3eb,eci,56g,jz2,76u,gnc,ic9,ie8,3d1,3d4,3d2,56j,c86,a9q,id3,idb,idj,ffk,ffl,ee1,id7,86i,86n,cdu,if6,ee2,idk,ozh,5z2,5u0,5u1,ee0,idi,ee4,a9o,a9p,cdq,a9r,ban,86p,ee8,edz,eoj,hjd,cdl,cdr,cdm,ee3,id9,idf,ifk,3ec,gmu,3di,gmv,gmt,3db,eoi,850,do4,83t,83v,3ee,hjc,idv,3da,862,idu,cc9,ccg,cca,gf1,edj,85c,3dj,ic8,idp,5jq",
	["Container.ItemsInType.Gem"]="nl1,out,nm1,nko,ou9,lvu,oud,ouk,nla,nln,ov7,nlp,ov5,nli,nl2,oua,nlh,nlu,nlr,ov8,nlq,ov3,nlk,nkv,ouf,nm0,oun,lp4,nku,nks,ov0,nll,ouv,nkr,ouq,nl8,o0c,nkn,ouu,lvv,oux,nlt,nm2,ov6,nm6,ov9,nkj,ouz,oui,nl9,oup,nlb,nkk,nlo,lp7,ouy,nkp,o0e,ovb,nm8,ov4,p9b,nkz,nm4,oum,ouw,nm3,nkw,ouc,lp2,ovt,nlm,ova,ous,nkl,nl0,oul,lp3,oug,o0d,our,nki,ouh,nm7,nkq,nls,ouj,lcv,oue,nkm,oub,ouo,nlj,ov1,nm5,hbv,ov2,ol3,lgh,lfu,ijf,jzd,ijj,ijz,jzf,i34,ikh,ijg,jz6,nly,nl7,jyj,ike,jzb,ijo,ik2,ikd,ik8,ol1,p6p,ol5,ika,jzh,ikj,i30,ikc,ijp,nzb,lvs,lvt,ik5,jz9,i35,i33,lgs,lft,ikb,p6o,jzc,hbw,e5b,pc4,iki,p09,ik3,ik9,iji,ik7,jyk,ik0,ijl,ik6,ijn,i32,lgk,lfl,ijr,ijk,jza,m19,m18,i31,ijh,jze,ik4,p0a,p6i,p6l,p6j,p6k,p6n,p6m,ol7,ol8,i10,i12,63p,9jf,9vk,hu5,ol2,92i,65f,ht1,8s6,9jd,htj,m2b,hu1,2zc,htu,ht3,htl,htt,gx5,hu2,hto,htw,hu0,aqu,ol0,9jg,ol4,htm,48s,16h,ivy,hts,9vj,1bd,htn,hu9,li,xi,htp,pc1,htr,hu4,htx,htk,htv,ivz,xm,hty,48q,ltu,hu6,f9a,htz,hu7,63q,hu8,hti,hu3,mq,ol6,ol9,lyi,lym,lyq,lyj,lyt,g27,lyp,496,66f,h0c,495,66g,lys,lyl,g2g,lyr,lyn,lyo,lyk,lyu",
	["Container.ItemsInType.Mining"]="dpn,ebm,9jc,fzn,1if,i3b,i2r,i3c,2rd,254,i3d,i2q,1gl,26y,253,4np,63r,l0,i3a,i2p,26x,26s,26w,24y,8rv,8ru,9jh,9rj,i39,i2o,i6t,26u,2rb,250,lm,h4r,28l,2z8,2z6,p1s,26r,h4q,63s,2z7,9jb,870,2rc,24z,1ej",

	["Misc.Argent Dawn Commission"]="9wu:1,a6x:2,fac:2,hwm:3,hwn:3",
	["Misc.Battleground Tokens"]="fv2,fv3,fv4,me8",
	["Misc.Battle Standard.Battleground"]="ecu,ecv",
	["Misc.Battle Standard.Alterac Valley"]="ep1,ep2",
	["Misc.Currency.Tier Sets.Tier 4"]="myh,myi,myj,myk,myl,mym,myn,myo,myp,myq,myr,mys,myt,myu,myv",
	["Misc.Currency.Tier Sets.Tier 5"]="nbw,nbx,nby,nbz,nc0,nc1,nc2,nc3,nc4,nc5,nc6,nc7,nc8,nc9,nca",
	["Misc.Currency.Tier Sets.Tier 6"]="nzl,nzm,nzn,nzo,nzp,nzq,nzr,nzs,nzt,nzu,nzv,nzw,nzx,nzy,nzz",
	["Misc.Currency.Instances"]="m1a,mpm,pdt,isw",
	["Misc.Currency.World"]="k3h,k3g,iyr,my0,mxz,iph,p4p,p4s",
	["Misc.Currency.Battlegrounds"]="fv4,fv3,me8,fv2",
	["Misc.Booze"]="gc3:3,grd:5,201:a,202:k,203:k,204:a,22m:5,23n:5,28e:5,2uv:a,3jn:k,3js:k,ko:k,758:k,780:k,781:1e,952:a,99f:1e,z2:k,d5k:k,d9o:5,d9q:a,dfe:k,dff:a,e3h:k,e3w:k,e3z:a,e40:k,etx:1e,ety:5,gbj:k,gai:a,fz9:a,nmf:k,p7f:k",
	["Misc.Darkmoon Faire.Card"]="evr,evs,evt,evu,okw,okz,oky,okx",
	["Misc.Engineering.Explosives"]="3d2,3d4,3d9,3de,56i,3di,3dm,3do,83v,3dy,3eb,3e2,ecc,842,862,85e,edt,cc9,ccl,cdk,ibc,ibd",
	["Misc.Engineering.Fireworks"]="76r,76t,76q,76u,eoi,76p,76o,gn5,4fg,gn6,gmt,gmu,gmv,gmx,gnv,gnt,gnp,gmy,gns,gnq,gn7,gna,gnc,gs0,gr8,gr6,gra",
	["Misc.Hallowed Wands"]="fql,fqm,fqn,fqx,fqy,fqz,fr1,fr2",
	["Misc.Hearth"]="5d0,m21",
	["Misc.Key.Other"]="ogo,9jy,lgg,5bh,ofb,ako,e2x,45w,8lg,8hk",
	["Misc.Key.Instance.Normal"]="o,5ii:Scarlet Monastery,9iw:UBRS,iwa:Karazhan,llj:Shadow Labyrinth,lwr:Shattered Halls,nzg:Arcatraz",
	["Misc.Key.Instance.Heroic"]="o,nmm:Hellfire Citadel (Alliance),nmn:Coilfang Reservoir,nmy:Tempest Keep,nn1:Hellfire Citadel (Horde),nmz:Caverns of Time,nmx:Auchindoun",
	["Misc.Lockboxes"]="4g0,3kp:p,3kq:1y,onk:91,4fy:69,3ko:1,3ku:69,3kt:4v,3ks:3h,4fz:69,d0y:1,d11:6y,apf:4v,56g:1,aqm:6y,4wi:1,mtd:8c,d10:4v,4wj:1y,5k9:1,9a9:7n,d0z:1y",
	["Misc.Minipet.Normal"]="iap,p58,fpv,ahc,p60,p66,nfc,jpb,ahb,h2a,p61,aha,9eh,f0a,8i7,7zs,n46,n2l,mno,7zt,n48,ht7,6jv,6jp,6jq,6jr,6ju,6js,6jt,8km,80p,80o,8cm,g0x,n41,6k4,gfp,6k5,gfw,ccc,94i,l6d,mnn,80u,3e9,oi8,6k0,6jw,6jy,6jz,94h,hr3,80q,6k1,hrb,n44,gft,n2m,n45,9o1,gfx,8uq,6k3,6k2,gf1,8ia,h5n,hqy,n2o,8ib,9go,n2n",
	["Misc.Minipet.Snowball"]="gfp,gft,gfw,gfx",
	["Misc.Mount.Ahn'Qiraj"]="gde:2s,gg9:2s,ggb:2s,ggc:2s,gc8:2s",
	["Misc.Mount.Normal"]="vg:1o,1uz:1o,1v2:1o,4d3:1o,4d4:1o,4dd:1o,4dg:1o,4iw:1o,4j4:1o,4j5:1o,6mk:1o,6lv:1o,6mn:1o,6mo:1o,6mr:1o,6np:1o,6nr:1o,6ns:1o,6od:1o,aa1:1o,aa2:1o,aab:1o,aac:1o,aad:1o,bsd:1o,bsq:1o,bss:1o,lz5:1o,my7:1o,my8:1o,mjo:1o,mjp:1o,mjq:1o,mbj:1o,fcu:2s,6mi:2s,9hq:2s,9hr:2s,9ii:2s,9j3:2s,9j5:2s,9j6:2s,a3i:2s,a9x:2s,aa6:2s,aa7:2s,aa8:2s,aa9:2s,aae:2s,aaf:2s,bst:2s,e2p:2s,e2q:2s,e2r:2s,e2s:2s,e2t:2s,e2u:2s,e2v:2s,e2w:2s,eha:2s,ehb:2s,ehg:2s,ehh:2s,ehi:2s,ehk:2s,ehl:2s,ehm:2s,eht:2s,ehu:2s,ehv:2s,ehw:2s,ehx:2s,ehy:2s,ehz:2s,ei1:2s,ei2:2s,ei3:2s,ei4:2s,ei5:2s,ei6:2s,el2:2s,eol:2s,eom:2s,fc0:2s,gc8:2s,mqh:2s,mqi:2s,mqj:2s,mqk:2s,mql:2s,mqm:2s,mqn:2s,mqo:2s,my9:2s,mya:2s,myb:2s,mjr:2s,mjs:2s,mbs:2s,mge:2s,mgf:2s,mgg:2s,mgh:2s,mjv:2s,mjw:2s,mjx:2s,mjy:2s,mb7:2s,mjz:2s,ok6:2s,ok8:2s,oka:2s,okc:2s,ok5:2s,ok7:2s,ok9:2s,okb:2s",
	["Misc.Mount.Flying"]="jnj:1o,jni:1o,jnk:1o,jnl:7s,jp4:7s,jp5:7s,jp3:7s,jnn:1o,jno:1o,jnm:1o,jp7:7s,jp9:7s,jnp:7s,jp8:7s,pcp:7s,pcq:7s,pcr:7s,pcs:7s,pct:7s,pcu:7s,oxm:7s,oxo:7s,oxp:7s,oxq:7s,oxr:7s",
	["Misc.Unlock.Seaforium Charges"]="3db:46,eci:8c,3e6:6y",
	["Misc.Unlock.Skeleton Keys"]="c8t:p,c8u:3h,c8v:5k,c8w:8c",

	["QuestMats.Ahn'Qiraj"]="c[Idol,c[20,g3m,g3n,g3o,g3p,g3q,g3r,g3s,g3t][40,g3u,g3v,g3w,g3x,g3y,g3z,g41,g42]][Scarab,g3e,g3f,g3g,g3h,g3i,g3j,g3k,g3l][Token,c[20,g44,g45,g46,g48,g49,g4a][40,g5a,g5b,g5c,g5d,g5e,g5f,g5g,g5h]]",

	["QuestMats.Arcanum.Constitution"]="92i,6hn,91x,980",
	["QuestMats.Arcanum.Focus"]="e59,e5b,b2g,9u9",
	["QuestMats.Arcanum.Protection"]="e5a,e5b,b2g,9tr",
	["QuestMats.Arcanum.Rapidity"]="e58,e5b,b2g,9ze",
	["QuestMats.Arcanum.Resilience"]="92i,8xb,92f,920",
	["QuestMats.Arcanum.Rumination"]="92i,92g,6i0,91w",
	["QuestMats.Arcanum.Tenacity"]="92i,91y,8x8,92h",
	["QuestMats.Arcanum.Voracity"]="92i,921,97z,8x7",

	["QuestMats.Darkmoon Faire.Deck.All"]="eu4,eux,ev7,evh,olu,omb,omi,olv",

	["QuestMats.Darkmoon Faire.Deck.Beasts"]="eu3,eu6,eu7,eu8,eu9,eua,eub,euc",
	["QuestMats.Darkmoon Faire.Deck.Elementals"]="ev8,ev9,eva,evb,evc,evd,eve,evf",
	["QuestMats.Darkmoon Faire.Deck.Portals"]="evg,evi,evj,evk,evl,evm,evn,evo",
	["QuestMats.Darkmoon Faire.Deck.Warlords"]="euy,euz,ev0,ev1,ev2,ev3,ev4,ev5",

	["QuestMats.Darkmoon Faire.Deck.Blessings"]="olm,olt,ols,olp,olo,olr,olq,oln",
	["QuestMats.Darkmoon Faire.Deck.Furies"]="om5,omd,omc,om8,om7,oma,om9,om6",
	["QuestMats.Darkmoon Faire.Deck.Lunacy"]="ome,omm,oml,omh,omg,omk,omj,omf",
	["QuestMats.Darkmoon Faire.Deck.Storms"]="olw,om4,om3,olz,oly,om2,om0,olx",

	["QuestMats.Darkmoon Faire.Turnin.Blacksmithing"]="2i0:1,2ou:4,2yj:8,64p:c,9r8:k",
	["QuestMats.Darkmoon Faire.Turnin.Engineering"]="3d7:1,3dj:4,76p:8,8xy:c,cca:k",
	["QuestMats.Darkmoon Faire.Turnin.Greys"]="3ja:5,3y5:c,3ym:1,8ss:k,8sv:4,fdp:k",
	["QuestMats.Darkmoon Faire.Turnin.Leather"]="1s5:1,1sa:4,4ff:8,6bd:c,c0c:k",

	["QuestMats.Libram.Burning Steppes"]="91w,91x,91y,920,921",
	["QuestMats.Libram.Dire Maul"]="e58,e59,e5a",

	["QuestMats.Zul'Gurub.Bijou"]="f7f,f7g,f7h,f7i,f7j,f7k,f7l,f7m,f7n",
	["QuestMats.Zul'Gurub.Coin.Set1"]="f76,f77,f78",
	["QuestMats.Zul'Gurub.Coin.Set2"]="f79,f7a,f7b",
	["QuestMats.Zul'Gurub.Coin.Set3"]="f7c,f7d,f7e",
	["QuestMats.Zul'Gurub.Primal"]="f7o,f7p,f7q,f7r,f7s,f7t,f7u,f7v,f7w",

	["Reagent.Ammo.Arrow"]="ne7:hn,pa0:eq,ohl:eq,9ri:5k,nmb:9g,iu4:aa,onh:aa,2o8:2n,ewk:4l,793:37,iu9:78,dx6:4v,lnc:8w,8ph:3m,2c6:23,1xs:f,1xv:z,ln9:64",
	["Reagent.Ammo.Bullet"]="ohj:eq,icd:by,pdf:aa,nmc:9g,pde:aa,abl:5p,8z2:50,2o9:2n,icc:78,840:3h,ewl:4l,841:46,ccd:4v,8pg:3m,684:19,683:k,685:2d,3ts:k,1xz:z,lng:64,lnh:8w,1xw:f,4ao:14,2c9:23",
	["Reagent.Ammo.Thrown"]="lun:mt,oqe:od,n61:nf,m8q:k9,oxy:p4,m43:lx,mj8:gz,mjf:fo,mcs:9v,lbj:e7,lsy:hw,pc0:gt,ljg:hd,ljt:dt,ljs:dt,m0n:c6,m0s:ee,m0w:g9,nlz:eh,mjg:c7,m0j:b4,m0v:fy,fhy:8c,jyu:8c,mj7:8w,m0m:bx,m0q:de,m0u:fg,m0o:cf,nbn:ee,m0r:dw,m0t:ey,oze:4w,m0k:bg,nl4:eh,mj5:2j,mts:2e,mj6:5i,m0p:cx,m0l:bp,jyo:t,mdy:7v,jyd:b,jyr:37,jys:53,mdt:36,mdx:7v,jyp:1r,jyq:2a,mcz:9,mds:1r,mdr:w,mdu:53,45f:l",
	["Reagent.Class.Druid"]="d4t,d4y,d56,d57,d58,d59,d5a,h37,h38",
	["Reagent.Class.Mage"]="d4s,d53,d54,d5s",
	["Reagent.Class.Paladin"]="gc9,d55",
	["Reagent.Class.Priest"]="d50,d51,d5s",
	["Reagent.Class.Rogue"]="3ys,49m",
	["Reagent.Class.Shaman"]="d52,d5t,d5u,3zr,3zs,3zt,3zu",
	["Reagent.Class.Warlock"]="4al,4u1,csn",
})
