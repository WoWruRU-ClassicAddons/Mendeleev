-- (c) 2007 Nymbia.  see LGPLv2.1.txt for full details.
--DO NOT MAKE CHANGES TO THIS FILE BEFORE READING THE WIKI PAGE REGARDING CHANGING THESE FILES
if not AceLibrary:HasInstance("PeriodicTable-3.0") then error("PT3 must be loaded before data") end
AceLibrary("PeriodicTable-3.0"):AddData("Consumable", "$Rev: 44954 $", {
	["Consumable.Anti-Venom"]="4z8:p,4z9:z,ady:1o,215:1o,f00:1o,9pm:1o,6yu:1o,2m2:1o",
	["Consumable.Bandage.Basic"]="1zp:36,6ld:uo,gyv:2mg,b7m:1jk,4z7:hs,2q3:8d,yr:1u,6lc:m8,gyu:25s,b7l:11s,4z6:b4,2q2:4h",
	["Consumable.Bandage.Battleground.Alterac Valley"]="ewb:1jk",
	["Consumable.Bandage.Battleground.Arathi Basin"]="fm0:uo,fm2:1jk,fm3:hs,fm5:uo,fmb:1jk,fmc:hs",
	["Consumable.Bandage.Battleground.Warsong Gulch"]="epn:uo,epm:1jk,epo:hs",

	["Consumable.Food.Bread"]="m,Consumable.Food.Edible.Bread.Basic,Consumable.Food.Edible.Bread.Bonus,Consumable.Food.Edible.Bread.Conjured",
	["Consumable.Food.Cheese"]="m,Consumable.Food.Edible.Cheese.Basic,Consumable.Food.Edible.Cheese.Bonus",
	["Consumable.Food.Fish"]="m,Consumable.Food.Edible.Fish.Basic,Consumable.Food.Edible.Fish.Bonus,Consumable.Food.Inedible.Fish",
	["Consumable.Food.Fruit"]="m,Consumable.Food.Edible.Fruit.Basic,Consumable.Food.Edible.Fruit.Bonus",
	["Consumable.Food.Fungus"]="m,Consumable.Food.Edible.Fungus.Basic,Consumable.Food.Edible.Fungus.Bonus",
	["Consumable.Food.Meat"]="m,Consumable.Food.Edible.Meat.Basic,Consumable.Food.Edible.Meat.Bonus,Consumable.Food.Inedible.Meat",
	["Consumable.Food.Misc"]="m,Consumable.Food.Edible.Misc.Basic,Consumable.Food.Edible.Misc.Bonus",
	["Consumable.Food.Edible.Basic.Conjured"]="m,Consumable.Food.Edible.Bread.Conjured",
	["Consumable.Food.Edible.Basic.Non-Conjured"]="m,Consumable.Food.Edible.Bread.Basic,Consumable.Food.Edible.Cheese.Basic,Consumable.Food.Edible.Fish.Basic,Consumable.Food.Edible.Fruit.Basic,Consumable.Food.Edible.Fungus.Basic,Consumable.Food.Edible.Meat.Basic,Consumable.Food.Edible.Misc.Basic",
	["Consumable.Food.Edible.Bonus"]="m,Consumable.Food.Edible.Bread.Bonus,Consumable.Food.Edible.Cheese.Bonus,Consumable.Food.Edible.Fish.Bonus,Consumable.Food.Edible.Fruit.Bonus,Consumable.Food.Edible.Fungus.Bonus,Consumable.Food.Edible.Meat.Bonus,Consumable.Food.Edible.Misc.Bonus",
	["Consumable.Food.Edible.Combo"]="m,Consumable.Food.Edible.Misc.Combo,Consumable.Food.Edible.Fungus.Combo,Consumable.Food.Edible.Fruit.Combo,Consumable.Food.Edible.Fish.Combo,Consumable.Food.Edible.Bread.Combo",
	["Consumable.Food.Edible.Battleground.Alterac Valley.Combo"]="ew5:3ei",
	["Consumable.Food.Edible.Battleground.Arathi Basin.Basic"]="fhb:tu,fhc:18o,fha:1no,flr:tu,fls:18o,flq:1no,flu:tu,flv:18o,flt:1no",
	["Consumable.Food.Edible.Battleground.Warsong Gulch.Basic"]="epi:tu,eph:18o,epg:1no",
	["Consumable.Food.Edible.Bread.Basic"]="f74:1e,g3d:1p,3i4:1p,3i5:6r,3i6:fc,3i8:oa,ch5:oa,3jt:12o,6wm:1no,hvc:1no,moi:5sc,lhr:3c0,lza:3c0,iko:6r,ns0:1p,mq1:5sc",
	["Consumable.Food.Edible.Bread.Combo"]="al8:1no",
	["Consumable.Food.Edible.Bread.Bonus"]="22j:6r,2tu:fc,d9p:1p",
	["Consumable.Food.Edible.Bread.Conjured"]="ux:6r,uy:fc,15b:oa,44l:1p,68b:12o,68c:1no,hnz:3c0,gzn:5sc",
	["Consumable.Food.Edible.Cheese.Basic"]="1li:1p,bi:6r,dfi:6r,bq:fc,1bf:oa,313:12o,6w4:1no,lht:3c0,mq0:5sc,ni2:3c0",
	["Consumable.Food.Edible.Cheese.Bonus"]="2tt:fc,9fe:12o",
	["Consumable.Food.Edible.Fish.Basic"]="ffg:1e,4vg:6r,gmo:12o,cxq:12o,22i:86,3jk:6r,3jl:fc,3jm:oa,3xj:6r,4uq:1p,5bb:12o,lv:1p,6gc:oa,6wt:1no,aga:12o,aqy:12o,ar3:1no,lcd:3c0,lhu:3c0,9fy:6r,ar1:1no,mq4:5sc,pi0:5sc,pi5:5sc",
	["Consumable.Food.Edible.Fish.Combo"]="22i:86,gbl:fr,g9b:4b",
	["Consumable.Food.Edible.Fish.Bonus"]="lci:5sc,lch:5sc,lcf:3c0,g9c:ai,gdd:nc,ar0:oa,aqx:oa,lce:3c0,n9n:3c0,lcj:5sc,ar2:1hp,aqv:12o,lcg:5sc,aqw:oa,484:6r,4nq:oa,9fc:12o,49j:fc,d3f:12o,pi4:5sc",
	["Consumable.Food.Edible.Fruit.Basic"]="mq2:5sc,ffe:1e,h84:1no,3i0:1p,3i1:6r,3i2:fc,3i3:oa,3ju:12o,6wp:1no,ch4:12o,g89:1no,g87:1no,g86:12o,moh:3c0,lhs:3c0",
	["Consumable.Food.Edible.Fruit.Combo"]="low:3ei,fgf:1yu",
	["Consumable.Food.Edible.Fruit.Bonus"]="p8x:4mo,ftw:1c,iix:3c0,97y:1hp,anm:1hp",
	["Consumable.Food.Edible.Fungus.Basic"]="3jw:1p,3jx:6r,3jy:fc,3jz:oa,3k0:12o,6wk:1no,lhv:3c0,nf7:5sc,mq5:5sc",
	["Consumable.Food.Edible.Fungus.Combo"]="2ns:86",
	["Consumable.Food.Edible.Fungus.Bonus"]="ixn:3c0",
	["Consumable.Food.Edible.Meat.Basic"]="gdv:1e,fff:1e,22f:1p,dfj:oa,ew9:fc,eu0:oa,etz:1p,ew8:6r,39:1p,1rj:6r,22h:1p,22l:fc,2wq:fc,2wr:oa,3jr:12o,486:fc,5be:6r,6wo:1no,ewa:12o,7gx:12o,7gx:1p,mq3:5sc,nma:3c0,lhq:3c0,i4n:1p,d7j:6r,8tw:1no,p7x:5sc,p7y:5sc",
	["Consumable.Food.Edible.Meat.Bonus"]="lc7:3c0,lc9:5sc,oft:5sc,lcc:5sc,ofs:5sc,lc3:3c0,g7z:1yu,lca:5sc,mlo:1no,s9:fc,22g:1p,22k:6r,22n:6r,288:1p,2hg:6r,2tq:6r,2vi:fc,2vj:fc,2vk:oa,2vl:oa,3ft:oa,480:1p,482:1p,485:6r,487:fc,488:fc,9f5:fc,9f6:oa,9f9:oa,9fk:1p,aor:oa,dae:12o,dx9:12o,fhm:oa",
	["Consumable.Food.Edible.Misc.Basic"]="2ns:86,dds:1p,481:86,dfj:oa,eu1:1no,kd:fc,49i:fc,5ks:fc,4vg:6r,ar1:1no,ch2:1p,ch3:6r,ch6:fc,ch7:1no,e33:12o,mp0:3c0,is2:1no,iu0:3c0",
	["Consumable.Food.Edible.Misc.Combo"]="gdb:2s,fqe:23,fqd:23,fqc:23,gm9:2s",
	["Consumable.Food.Edible.Misc.Bonus"]="gee:1c,nf9:5sc,nfd:5sc,aqz:oa,e32:1hp,ixo:1no,hh1:6r,lzp:3c0,nfa:5sc,nfb:5sc,fs4:1no,k4:6r,u2:fc,2tr:fc,2ts:fc,49h:6r,4nq:oa,5bc:1p,8xs:1p,9f8:oa,9fa:oa,9fb:12o,9fc:12o,d9q:1p",
	["Consumable.Food.Inedible.Fish"]="22b,3jv:oa,3lb,47w,48v,48w,4up:1p,4ur:u,4v3:u,4v8:6r,4vh:1p,4wp:1p,4wq:fc,65i,6gd:fc,6wv:12o,9f2,am2:oa,am3:oa,am4:oa,am6:oa,am7:oa,am8:oa,apt:12o,apx:12o,cac,apu,aps:12o,l5q,l63,l65,l66,l67,l5x,l5t",
	["Consumable.Food.Inedible.Meat"]="k9,frc,ld,s7,u1,228,229,22d,298,2g5,2mk,2tv,2v4,2vm,2vn,3nn,3wb,47t,47v,47x,47y,47z,9ad,9eg,9ey,9ez,9f0,9f1,9f4,9fj,lcl,lcn,lct,lcu,hh0,ivx,lck,i9o,ofq,lcq,ofr,lcy,lcx",

	["Consumable.Food.Bonus"]="m,Consumable.Food.Edible.Bread.Bonus,Consumable.Food.Edible.Cheese.Bonus,Consumable.Food.Edible.Fish.Bonus,Consumable.Food.Edible.Fruit.Bonus,Consumable.Food.Edible.Fungus.Bonus,Consumable.Food.Edible.Meat.Bonus,Consumable.Food.Edible.Misc.Bonus",

	["Consumable.Food.Buff.Agility"]="aqw:a,lcg:k,nfa:k,lcb:k",
	["Consumable.Food.Buff.Attack Power"]="lc7:14",
	["Consumable.Food.Buff.Healing"]="lci:18,nf9:18",
	["Consumable.Food.Buff.HP Regen"]="ar0:6",
	["Consumable.Food.Buff.Intellect"]="e32:a",
	["Consumable.Food.Buff.Mana Regen"]="g9c:3,gdd:6,aqz:8,lcf:8",
	["Consumable.Food.Buff.Stamina"]="hh1:4,2vl:8,aqv:a,ar2:a,97y:a,iix:a,lzp:a,dae:c,d3f:c,dx9:c,9fe:c,ixo:e,n9n:k,lc3:k,lcc:k,lce:k,ofs:k,ftw:k,gee:k,g7z:p,lcf:k,p8x:k,lcj:u,pi4:u",
	["Consumable.Food.Buff.Spell Damage"]="oft:n,lc9:n,nfd:n,lch:n",
	["Consumable.Food.Buff.Spirit"]="hh1:4,2vl:8,aqx:a,ixn:a,dae:c,d3f:c,dx9:c,9fe:c,ixo:e,lc3:k,lc7:k,lc9:k,lca:k,lcb:k,lcc:k,lce:k,lcg:k,lch:k,lci:k,lcj:k,n9n:k,nf9:k,nfa:k,nfb:k,nfd:k,ofs:k,oft:k,ftw:k,gee:k,p8x:k,pi4:u",
	["Consumable.Food.Buff.Strength"]="anm:a,fs4:k,mlo:k,nfb:k,lca:k",

	["Consumable.Food.Buff.Other"]="9fd",

	["Consumable.Food.Combo Health"]="g9b:4b,gbl:fr,22i:86,2ns:86,al8:1no,fgf:1yu,ew5:3ei,low:3ei,p8y:1no",
	["Consumable.Food.Combo Mana"]="g9b:8r,gbl:oi,22i:86,2ns:86,al8:3ei,fgf:3ei,ew5:3ei,low:3ei,p8y:3ei",
	["Consumable.Food.Combo Percent"]="gm9:2s,fqc:23,fqd:23,fqe:23,gdb:2s",
	["Consumable.Food.Percent.Basic"]="f74:1e,ffe:1e,fff:1e,gdv:1e,ffg:1e",
	["Consumable.Food.Percent.Bonus"]="ftw:1c,gee:1c",

	["Consumable.Jeweler.Statue"]="joa:8,jyw:g,jyx:o,jyy:10,jyz:1e",
	["Consumable.Leatherworking.Drums"]="ms8:1 29530:2 29531:3 29529:4 29532:5",

	["Consumable.Mage.Mana Stone"]="495:go,496:b4,66f:nm,66g:uk,h0c:yq",

	["Consumable.Potion.Buff.Armor"]="4ml:1e,6wn:6y,2m5:46,adh:ci,3kf:rs,adr:1jk",
	["Consumable.Potion.Buff.Attack Power"]="748:7d,9w4:z",
	["Consumable.Potion.Buff.Elemental Protection"]="4o0:p0,4o1:104,4o2:1e0,4o3:b4,4o4:1e0,adt:208,adv:208,ads:208,adu:208,adx:208",
	["Consumable.Potion.Buff.Health"]="1wa:r,2y9:3c,afa:xc",
	["Consumable.Potion.Buff.Mana"]="afb:1jk",
	["Consumable.Potion.Buff.Other"]="2m3,868,2y7,1wb,4mk,2yc,74h,72a,72s,4ci,73h,4x0,af6,6kx",
	["Consumable.Potion.Buff.Regen"]="2ly:2,2m4:6,2ya:c",
	["Consumable.Potion.Buff.Resistance"]="70g:a,2m0:p,6z0:1e,afd:p",
	["Consumable.Potion.Buff.Spell Damage"]="4x1:a,dnw:f,adq:z,72b:k,75c:14,afc:46",
	["Consumable.Potion.Buff.Stat.Agility"]="1w9:4,2m6:8,6wl:f,737:p,ado:p,hm7:z",
	["Consumable.Potion.Buff.Stat.Intellect"]="2lz:6,adj:i,72z:p",
	["Consumable.Potion.Buff.Stat.Spirit"]="adj:i",
	["Consumable.Potion.Buff.Stat.Stamina"]="adp:i",
	["Consumable.Potion.Buff.Stat.Strength"]="1w6:4,552:8,2m7:8,adp:i,73q:p",
	["Consumable.Potion.Other.Energy"]="5x8,l9d",
	["Consumable.Potion.Other.Rage"]="4cf:u,4ch:19,ade:19",

	["Consumable.Potion.Other.Cure"]="2m2,ady,6yu,215",
	["Consumable.Potion.Recovery.Dreamless Sleep"]="9em:xc,ffm:1mc,hmc:2s0",
	["Consumable.Potion.Recovery.Healing.Basic"]="3a:28,nu:4g,3jo:4g,pt:8w,1bi:eg,8x6:im,314:m8,ejb:m8,adi:12w,oke:12w,okf:12w,oks:12w,okt:12w,lok:12w,idq:1jk,hm5:1jk,pf7:1jk",
	["Consumable.Potion.Recovery.Healing.Blades Edge"]="pao:12w,pe6:12w",
	["Consumable.Potion.Recovery.Healing.Coilfang"]="pe0:1jk",
	["Consumable.Potion.Recovery.Healing.PvP"]="ddx:hs,ddw:v4",
	["Consumable.Potion.Recovery.Healing.Tempest Keep"]="pe1:1jk",
	["Consumable.Potion.Recovery.Mana.Basic"]="1w7:4g,2m1:8w,2yb:eg,4qt:m8,adf:xc,ejd:xc,adg:1e0,okg:1e0,okh:1e0,oku:1e0,okv:1e0,lol:1e0,idr:1uo,hm8:1uo,pf8:1uo,ofx:2gw",
	["Consumable.Potion.Recovery.Mana.Blades Edge"]="pe5:1uo,pan:1uo",
	["Consumable.Potion.Recovery.Mana.Coilfang"]="pdz:1uo",
	["Consumable.Potion.Recovery.Mana.Pvp"]="ddz:v4,de0:hs",
	["Consumable.Potion.Recovery.Mana.Tempest Keep"]="pdy:1uo",
	["Consumable.Potion.Recovery.Rejuvenation"]="1w8:3c,980:bt,720:ku,msb:ku,e31:18g,hmq:1p4",
	["Consumable.Recovery.Rune"]="fu0:xc,9rq:xc",
	["Consumable.Recovery.Stone.Healing.Other"]="97z:m8,p4y:1jk",
	["Consumable.Recovery.Stone.Healing.Warlock"]="m,Consumable.Warlock.Healthstone,",

	["Consumable.Scroll"]="c[Agility,2bo:5,151:9,3ex:d,7yd:h,l7u:k][Intellect,qj:4,1rm:8,3er:c,7yc:g,l7v:k][Protection,2bp:1o,152:3c,3et:50,7y9:6o,l7w:8c][Spirit,wt:3,1bk:7,3ew:b,7ya:f,l7x:u][Stamina,ws:4,1bj:8,3eu:c,7yb:g,l7y:k][Strength,qi:5,1rl:9,3ey:d,7ye:h,l7z:k]",

	["Consumable.Buff.Agility.Self"]="1w9:4,2m6:8,6wl:f,loo:f,737:p,ado:p,hm7:z",
	["Consumable.Buff.Agility.Target"]="2bo:5,151:9,3ex:d,7yd:h,l7u:k",
	["Consumable.Buff.Intellect.Self"]="2lz:6,loo:f,adj:i,72z:p,oqr:u",
	["Consumable.Buff.Intellect.Target"]="qj:4,1rm:8,3er:c,7yc:g,l7v:k,9m2:u",
	["Consumable.Buff.Spirit.Self"]="loo:f,adj:i,oqr:u",
	["Consumable.Buff.Spirit.Target"]="glr:k,wt:3,1bk:7,3ew:b,7ya:f,l7x:u",
	["Consumable.Buff.Stamina.Self"]="d5k:a,gai:a,gbj:f,loo:f,adp:i,nmf:k",
	["Consumable.Buff.Stamina.Target"]="ws:4,1bj:8,3eu:c,7yb:g,l7y:k",
	["Consumable.Buff.Strength.Self"]="1w6:4,552:8,2m7:8,loo:f,adp:i,73q:p,hm0:z,hmd:23,hm4:3c",
	["Consumable.Buff.Strength.Target"]="qi:5,1rl:9,3ey:d,7ye:h,l7z:k,9lv:u",

	["Consumable.Buff.Absorb.Self.Arcane"]="adx:208,hml:2mg",
	["Consumable.Buff.Absorb.Self.Damage"]="oqn:k",
	["Consumable.Buff.Absorb.Self.Fire"]="4o1:104,adt:208,hmh:2mg",
	["Consumable.Buff.Absorb.Self.Frost"]="4o2:1e0,ads:208,hmi:2mg",
	["Consumable.Buff.Absorb.Self.Holy"]="4o3:b4,hmn:2mg",
	["Consumable.Buff.Absorb.Self.Nature"]="4o4:1e0,adu:208,hmk:2mg",
	["Consumable.Buff.Absorb.Self.Shadow"]="4o0:p0,adv:208,hmm:2mg",
	["Consumable.Buff.Armor.Self"]="4ml:1e,2m5:46,6wn:6y,adh:ci,hma:fa,3kf:rs,adr:1jk,hmp:1xg",
	["Consumable.Buff.Armor.Target"]="2bp:1o,152:3c,3et:50,7y9:6o,l7w:8c",
	["Consumable.Buff.Attack Power.Self"]="748:7d,9w4:z,ms8:1o,lom:1o,ofz:3c",
	["Consumable.Buff.Attack Power.Target"]="9m4:14",
	["Consumable.Buff.Attack Speed.Self"]="ms9:28",
	["Consumable.Buff.Attack Speed.Target"]="9lu:3",
	["Consumable.Buff.Casting Speed.Self"]="ms9:28",
	["Consumable.Buff.Chest"]="i6f:5k,jox:b4",
	["Consumable.Buff.Dodge.Target"]="9m3:1o",
	["Consumable.Buff.Energy.Self"]="5x8,l9d",
	["Consumable.Buff.Fear"]="msc",
	["Consumable.Buff.Fire Power"]="4x1:a,gmi:14,hm9:1t",
	["Consumable.Buff.Free Action"]="ffs,4ci",
	["Consumable.Buff.Frost Power"]="dnw:f,hm3:1j",
	["Consumable.Buff.Healing.Self"]="lon:o,hm1:1e",
	["Consumable.Buff.Health.Self"]="1wa:r,2y9:3c,oqm:6y,hmd:jg,afa:b4,hl9:1jk,hmr:dw,lcj:8c,pi4:8c,ofs:5k,lcc:5k,lcf:5k,lce:5k,g7z:6y,n9n:5k,lc3:5k,p8x:46",
	["Consumable.Buff.Mana.Self"]="afb:1jk",
	["Consumable.Buff.Other.Self"]="2m3,868,2y7,4mk,2yc,74h,72a,72s,4ci,73h,4x0,af6,6kx",
	["Consumable.Buff.Rage.Self"]="4cf:u,4ch:19,ade:19",
	["Consumable.Buff.Regen Health.Self"]="2ly:2,2m4:6,oqm:a,2ya:c,ffo:k",
	["Consumable.Buff.Regen Mana.Self"]="ffr:c,hmg:g",
	["Consumable.Buff.Resilience.Self"]="oqs:u",
	["Consumable.Buff.Resistance.Self"]="70g:a,2m0:p,6z0:1e,afd:p",
	["Consumable.Buff.Resistance.Target"]="9lz:f,9m1:f",
	["Consumable.Buff.Shadow Power"]="75c:14,hmb:1t",
	["Consumable.Buff.Shield"]="i6v:rs,i6w:334",
	["Consumable.Buff.Speed.Self"]="msa:f,fht:k,1wb:1e",
	["Consumable.Buff.Spell Crit.Self"]="lon:o",
	["Consumable.Buff.Spell Crit.Target"]="g0d:e",
	["Consumable.Buff.Spell Damage.Self"]="4x1:a,dnw:f,lon:o,ms8:u,adq:z,72b:k,75c:14,hm9:1j,afc:1y,lc9:n,lch:n,oft:n",
	["Consumable.Buff.Spell Damage.Target"]="g0d:10,g0a:g,g0e:o,hdm:16",
	["Consumable.Buff.Spell Reflect.Self"]="fhs:3",
	["Consumable.Buff.Water Breathing"]="iud:u",

	["Consumable.Buff Group.General.Self"]="m,Consumable.Buff.Absorb.Self.Damage,Consumable.Buff.Health.Self,Consumable.Buff.Regen Health.Self,Consumable.Buff.Resilience.Self,Consumable.Buff.Spirit.Self,Consumable.Buff.Stamina.Self,Consumable.Buff.Dodge.Self,Consumable.Buff.Resistance.Self,Consumable.Buff.Speed.Self,Consumable.Buff.Absorb.Self,Consumable.Buff.Spell Reflect.Self,Consumable.Buff.Free Action,Consumable.Buff.Water Breathing",
	["Consumable.Buff Group.General.Target"]="m,Consumable.Buff.Health.Target,Consumable.Buff.Regen Health.Target,Consumable.Buff.Spirit.Target,Consumable.Buff.Stamina.Target,Consumable.Buff.Dodge.Target,Consumable.Buff.Resistance.Target,Consumable.Buff.Absorb.Target",
	["Consumable.Buff Group.Caster.Self"]="m,Consumable.Buff.Casting Speed.Self,Consumable.Buff.Healing.Self,Consumable.Buff.Intellect.Self,Consumable.Buff.Mana.Self,Consumable.Buff.Regen Mana.Self,Consumable.Buff.Shadow Power,Consumable.Buff.Spell Crit.Self,Consumable.Buff.Spell Damage.Self",
	["Consumable.Buff Group.Caster.Target"]="m,Consumable.Buff.Intellect.Target",
	["Consumable.Buff Group.Melee.Self"]="m,Consumable.Buff.Armor.Self,Consumable.Buff.Agility.Self,Consumable.Buff.Attack Power.Self,Consumable.Buff.Attack Speed.Self,Consumable.Buff.Strength.Self",
	["Consumable.Buff Group.Melee.Target"]="m,Consumable.Buff.Armor.Target,Consumable.Buff.Agility.Target,Consumable.Buff.Attack Power.Target,Consumable.Buff.Attack Speed.Target,Consumable.Buff.Strength.Target",

	["Consumable.Quest.Usable"]="5k7,6mg,7a5,7a7,7aa,7ay,7eu,7f6,7f7,7f8,7f9,7p6,88v,88w,88x,88y,897,8l8,8lh,8m9,8nz,8ob,8tx,8w2,8xd,8xe,90i,93w,981,9h8,9h8,9hc,9mg,9p1,9p2,9qr,9vr,9vz,9y3,9yi,9yy,9z4,apw,bxa,c5y,el4,eos,esv,gr3,gud,guh,h6b,hyc,i09,i0x,i1u,i2h,i8t,ia3,ibp,ibr,if7,if8,if9,iij,il0,iqe,iqp,iri,isj,iuk,ivn,ivu,iwi,iwl,iy8,jn6,jnd,jps,jpv,jsq,jvu,jvv,jy5,k2a,l7b,lmu,lpg,lw1,lyc,lyf,m0z,m2n,m3e,mci,me2,mjb,mph,mpv,mqp,mqu,mqy,mrt,my1,mz6,mzv,n09,n0a,n2w,n7y,na7,nf5,ni6,nin,nio,nip,njz,nkx,nmg,nmi,nn2,nn3,nnf,nng,nnh,nni,now,npb,npd,nsv,nsy,nt1,o04,o0h,o0i,o0o,o0p,o11,o16,o5q,o6o,o6u,o74,o7g,o7h,o7u,o8b,o9z,oav,obh,obi,oe2,of8,ofj,oi2,oib,oih,ojj,ojk,ojm,ok1,one,oxn,oxt,p06,p1a,p1k,p1v,p2v,p4w,p5m,p75,p7s,p88,p8a,p9h,pbt,pc2,8i4,ixm",

	["Consumable.Warlock.Firestone"]="yu,akj,akk,akl,h2o",
	["Consumable.Warlock.Healthstone"]="491:dw,492:m8,493:6y,494:2s,79p:xc,enw:32,enx:3c,eny:7n,enz:8c,eo0:fa,eo1:go,eo2:og,eo3:qo,eo4:10o,eo5:140,h1z:1ls,h20:1rk,h21:1xc",
	["Consumable.Warlock.Soulstone"]="49e:8,ahu:b,ahv:e,hh2:k",
	["Consumable.Warlock.Spellstone"]="41c,d18,d19,d1b,d1c,h2c",

	["Consumable.Water.Basic"]="12x:1o,4f:47,wr:c4,dfg:c4,xh:n7,7aj:n7,ew3:n7,1bg:11c,3p3:11c,8d5:11c,dfh:11c,19p:1jc,ew4:1jc,6ri:29i,hvd:29i,lwv:3xo,lhw:5k0,moj:5k0,iiv:38o,ni1:5k0,mq6:3xo,mop:5k0,iiu:29i,i75:29i,phu:5k0,p7g:5k0,p1h:5k0",
	["Consumable.Water.Battleground.Arathi Basin"]="fhb:1p6,fhc:2ju,fha:3ei,flr:1p6,fls:2ju,flq:3ei,flu:1p6,flv:2ju,flt:3ei",
	["Consumable.Water.Battleground.Warsong Gulch"]="epi:1p6,eph:2ju,epg:3ei",
	["Consumable.Water.Buff.Spirit"]="anp:3ei,ewm:3ei",
	["Consumable.Water.Conjured"]="44m:47,1rk:c4,1nc:n7,2ws:11c,68d:1jc,68e:29i,68f:38o,nov:3xo,gzm:5k0",
	["Consumable.Water.Percentage"]="ffh:1o,ge1:1o",

	["Consumable.Weapon Buff.Misc"]="2yd",
	["Consumable.Weapon Buff.Oil.Mana"]="g09:4,g0b:8,g0c:c,hdl:e",
	["Consumable.Weapon Buff.Oil.Wizard"]="g08:8,g0a:g,g0e:o,g0d:10,hdm:16",
	["Consumable.Weapon Buff.Poison.Anesthetic"]="guj:49",
	["Consumable.Weapon Buff.Poison.Crippling"]="2wv:1e,2ww:1y",
	["Consumable.Weapon Buff.Poison.Deadly"]="28c:10,28d:1g,6xk:28,6xl:30,g30:3s,h0l:40,h0m:50",
	["Consumable.Weapon Buff.Poison.Instant"]="5cz:m,5d1:y,5d2:1e,6vy:24,6vz:2x,6w0:3m,gx3:4q",
	["Consumable.Weapon Buff.Poison.Mind Numbing"]="41h:14,5d3:1e,736:1o",
	["Consumable.Weapon Buff.Poison.Wound"]="8fa:h,8fc:p,8fd:12,8fe:1h,h0n:1t",
	["Consumable.Weapon Buff.Stone.Sharpening Stone"]="hua,27i:2,27j:3,27r:4,658:6,9kk:8,e3a,i5k:c,i5l:e",
	["Consumable.Weapon Buff.Stone.Weight Stone"]="2hz:2,2i0:3,2i1:4,659:6,9r7:8,lxg:c,lxh",
})
