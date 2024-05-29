pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include variables.lua
#include main.lua
#include stars.lua
#include ship.lua
#include energy_bar.lua
#include enemies/enemies.lua
#include enemies/spawn.lua
#include enemies/waves.lua
#include enemies/behavior.lua
#include pickups.lua
#include bullets.lua
#include collisions.lua
#include game/start.lua
#include game/wave.lua
#include game/game.lua
#include game/game_over.lua
#include game/win.lua
#include tools.lua
#include hud.lua
#include particles.lua
#include behavior.lua
#include fire.lua
#include boss.lua

__gfx__
00000000000800000008000000080000007770000077700000a790000097a00000777000000700000001000000330330337aa93333faa933337aa93300000000
0000000000280000002820000008200000a770000077a000009a0000000a90000077a0000078700000101000333e320337eeee933feeee9337eeee9300000000
007007000028200000282000002820000097a00000a79000000900000009000000a79000078e87000100010033feee307e7770e9fe8770e97e87708900000000
0007700002e82000028e82000028e200000a9000009a00000000000000000000009a00000787870001000100efeeeee2f8708709f8700709f887708900000000
00077000027822002287822002287200000900000009000000090000000000000009000078ece87010000010eeeeeee2f8708709f8770709f887708900000000
007007002ece880088ece880088ece20009000000000900000900000000900000000900078868870100000100eeeee20f8777089f6877069f888888900000000
000000000268890098868890098862000000900000900000000000000000000000000000078987000100010000eeee203f7088933f6806933f87709300000000
0000000002982000028982000028920000000000000000000000000000000000000000000077700000111000000ee20033faa93333faa93333faa93300000000
00a7a000000000000001100000299200000000000000000000000000000000000000000000000000000000000000000033333397335000970000000000000000
0a777a0000099000001cc1000097a900000002222222022220222002222222022222220002222220022220222222200033000933350709130000000000000000
0a777a00009aa90001c77c10009aa90000002eeeeeee2eeee2eee22eeeeeee2eeeeeee20266666622eeee2eeeeeee20030070003507000010000000000000000
0977790009a77a9001c77c10002992000002eeeeeeee2eeee2eee2eeeeeeee2eeeeeeee2667777662eeee2eeeeeeee2000700000000000000000000000000000
09a7a90009a77a90001cc100000000000002eeeeeeee2eeee2eee2eeeeeeee2eeeeeeee2677777762eeee2eeeeeeee2000000000000000000000000000000000
089a9800009aa900000c1000000000000002eee222222eeee2eee2eeee22222eeee2eee2677777762eeee2eee22eee2000000000500000010000000000000000
00898000000990000001c000000000000002eee222002eeee2eee2eeee22002eeee2eee2677777762eeee2eee22eee2030000503350000130000000000000000
0008000000000000000c1000000000000002eeeeee202eeeeeeee2eeeeee202eeee2eee2677777762eeee2eee22eee2033000033335001330000000000000000
022220000eeee00007777000000000000002eeeeee2002eeeeee22eeeeee202eeee2eee2677777762eeee2eee22eee2000000000000000000000000000000000
22ee2200ee77ee0077227700000000000002eee22200002eeee202eeee22002eeee2eee2677777762eeee2eee22eee2000000000000000000000000000000000
2e77e200e7227e0072ee2700000000000002eee22222002eeee202eeee22222eeee2eee2677777762eeee2eee22eee2000000000000000000000000000000000
2e77e200e7227e0072ee2700000000000002eeeeeeee202eeee202eeeeeeee2eeee2eee2677777762eeee2eeeeeeee2000000000000000000000000000000000
22ee2200ee77ee0077227700000000000002eeeeeeee202eeee202eeeeeeee2eeee2eee2d777777d2eeee2eeeeeeee2000000000000000000000000000000000
022220000eeee000077770000000000000002eeeeeee202eeee2002eeeeeee2eeee2eee22dddddd22eeee2eeeeeee20000000000000000000000000000000000
00000000000000000000000000000000000002222222000222200002222222022220222002222220022220222222200000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0077a90000ee82000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07aaaa900e8888200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7a666aa9e8c668820000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7f7776a9ef7776820000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
af7717a98f7717820000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
af7717a98f7717820000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0af71f9008f71f200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00aaa900008882000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000033333333000000000000000000000000
00000000000022222222200000000000000000000000222222222000000000000000000000002222222220000000000033333333000000000000000000000000
00000000022228888888222200000000000000000222288888882222000000000000000002222888888822220000000033336333000000000000000000000000
00000000228888888888888220000000000000002288888888888882200000000000000022888888888888822000000033611333000000000000000000000000
00000022288888888888882822200000000000222888888888888828222000000000002228888888888888282220000036000633000000000000000000000000
00000228888888888888888888220000000002288888888888888888882200000000022888888888888888888822000036000163000000000000000000000000
00002288888888888888282828222000000022888888888888882828282220000000228888888888888828282822200060060013000000000000000000000000
000022888888ffffffff888888822000000022888888ffffffff888888822000000022888888ffffffff88888882200060000016000000000000000000000000
000228888ffff666666ffff828282200000228888ffff666666ffff828282200000228888ffff666666ffff82828220060000016000000000000000000000000
00228888fff660000006666f8888822000228888fff660000006666f8888822000228888fff660000006666f8888822060000016000000000000000000000000
002288fff660000000000006ff282220002288fff660000000000006ff282220002288fff660000000000006ff28222036000163000000000000000000000000
00228ff6600000000000000066f2822000228ff6600000000000000066f2822000228ff6600000000000000066f2822033600133000000000000000000000000
02288ff0000000000000000000f8282202288ff0000000000000000000f8282202288ff0000000000000000000f8282233600633000000000000000000000000
0228ff600000000000000000006f82220228ff600000000000000000006f82220228ff600000000000000000006f822233361333000000000000000000000000
0228f6000000000000000000000f28220228f6000000000000000000000f28220228f6000000000000000000000f282233336333000000000000000000000000
0228f0000000000000000000000f82220228f0000000000000000000000f82220228f0000000000000000000000f822233333333000000000000000000000000
022800000000000000000000000028220228f0000000000000000000000f28220228f0000000000000000000000f282200000000000000000000000000000000
0228f0000000000000000000000f82220228ff000000000000000000000f82220228ff000000000000000000000f822200000000000000000000000000000000
0228ff000000000000000000000f282202288fff000000000000000000f8282202288fff000000000000000000f8282200000000000000000000000000000000
02288fff000000000000000000f2822202288888f00000000000000f0082822202288888f00000000000000f0082822200000000000000000000000000000000
00228888f00000000000000f28282220002288888fff00000000fff828282220002288888fff00000000fff82828222000000000000000000000000000000000
002288888fff00000000fff282828220002288888888f000000f828282828220002288888888f000000f82828282822000000000000000000000000000000000
002288882828f000000f2828282822200022888828282ffffff82828282822200022888828282ffffff828282828222000000000000000000000000000000000
0002288888888ffffff2828282822200000228888888888882828282828222000002288811888888828282118282220000000000000000000000000000000000
00002228282828282828282828222000000022281128282828282811282220000000222821191919191919182822200000000000000000000000000000000000
00002288118888888282821182822000000022888119191919191112828220000000228881111119191111128282200000000000000000000000000000000000
00000228211919191919111828220000000002282821111919111128282200000000022828111111111111182822000000000000000000000000000000000000
00000022285191111111918222200000000000222881911111119182222000000000002228819111111191822220000000000000000000000000000000000000
00000000222821919191282220000000000000002228219191912822200000000000000022282191919128222000000000000000000000000000000000000000
00000000022222828282222200000000000000000222228282822222000000000000000002222282828222220000000000000000000000000000000000000000
00000000000022222222200000000000000000000000222222222000000000000000000000002222222220000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00e8880000e8880000e8880000e8880000e8880000e8880000e8880000e8880000e8880000e8880000e8880000e8880000e8880000e8880000e8880000000000
0e2222800e2222800e2222800e2222800e2222800e2222800e2222800e2222800e2222800e2222800e2222800e2222800e2222800e2222800e22228000000000
e22e2228e2e22228e2e22228e2e22228e2666628e2666628e2666628e2666628e2666628e2666628e2666628e2666628e2666628e2666628e266662800000000
82e22228822222288222222882600628867007788700077887007778877007788770007887770078867777688677776886777768867777688677776800000000
82222228822222288660066886700768877007788700077887007778877007788770007887770078877007788770007887770078870007788700777800000000
82222128826006288266672882777728827777288277772882777728827777288277772882777728827007288270002882770028820007288200772800000000
08222280082222800822228008222280082222800822228008222280082222800822228008222280082222800822228008222280082222800822228000000000
00888800008888000088880000888800008888000088880000888800008888000088880000888800008888000088880000888800008888000088880000000000
00b33b0000b33b0000b33b0000b33b0000b33b0000b33b0000b33b0000b33b0000b33b0000b33b0000b33b0000b33b0000b33b0000b33b0000b33b0000000000
0b3333b00b3333b00b3333b00b3333b00b3333b00b3333b00b3333b00b2222b00b6262b00b6262b00b6862b00b6668b00b6666b00b6666b00b6666b000000000
b336333bb336333bb336633bb336633bb366663bb366663bb322223bb266262bb268686bb288886bb287786bb877778bb677776bb670776bb677776b00000000
33626333336266333362263333622633362222633622226332668623326888233888882338877883387777833771777337777173377177733777777300000000
33622633362222633628226336282263322888233282828338888883388888633888888338807883387077833770777337777073377777733771777300000000
33362633336626333362263336228263328282233288882332686823326868233268686332888883328778833877776337777773377777733770777300000000
03336330033363300336633003622630036226300382223003222230032222300362623003626230036262300367783003777730037777300377773000000000
00333300003333000033330000366300003663000033330000333300003333000033330000333300003333000033330000333300003333000033330000000000
022882200228e2200228e2200228e2200228e2200228e22002266220022662200226622002266220022662200226622002266220022662200226622000000000
228eee22228eee22228eee22228eee22228eee222266662222637622226376222267762222677622226776222267762222677622226736222263762200000000
28eeeee228eeeee228eeeee228eeeee228fffff22673776226737762267377622677776226737762267737622677776226773362267737622673776200000000
08eeeee008eeeee008fffff008fffff0066636600773777007737770077377700737777007737770077737700777737007777370077737700773777000000000
08eeeee008fffff00863666006663660077737700773777007737770077377700733777007737770077737700777337007777770077737700773777000000000
022ff220022662200247742002277220022772200227722002277220022772200227722002237220022732200227722002277220022772200227722000000000
00022000000220000002200000022000200220004002200040022000400220024002200440022004400220044002200440022004400220044002200400000000
00000000000000000000000000000000000000000200000004200000042000000420002004200240044202400440024004402440042004400420024000000000
00000000000000000002000000020000000200000022220000222200002662000026620000266200002662000026620000266200002662000026620000000000
00000000000000000000000000001000001111000211112002111620021776200267762002677620026776200267762002677620026776200267762000000000
00000000001000000001100020111100211111102111111221116762216777622677776226777762267777622677776226777762267777622677776200000000
0000000000000000200000020010110221111112211111622111677221677c7227777c722777777227777772277777722777777227c77772277cc77200000000
0000000000000000001001002011010221111112211111622111677221677c7227777c722777c772277c7772277c7772277c777227c77772277cc77200000000
0000000000000000001010000010110001111112211111122111676221677c6226777c622677c762267c7762267c7762267c776226c777622677776200000000
0000000000000000000000000000100002111120021111200211162002177620026776200267c620026c7620026c7620026c7620026776200267762000000000
00000000000020000002000000020000002120000022220000222200002662000026620000266200002662000026620000266200002662000026620000000000
00055000000550000005500000055000000650000005500000055000000550000005500000055000000550000005500000055000000550000005500000000000
006d25000062d5000062d500006d2500006d25000067d5000067d500006775000067750000677500006775000067750000677500006775000067750000000000
06d2d250067d2d50067d2d500677d2500677d25006777d5006777d50067777500677775006777750067777500677775006777750067777500677775000000000
6d2d2d2562d7d2d56d77d2d56d776d2567776d25677767d5677677d5677767756777767567777775677777756767777567767775677667756776677500000000
52d2d2d15d2d6d2152d76d2152d767d15d7767d15d77677157767771577767715777767157776771577677715767777157767771577667715776677100000000
052d2d1005d2d710052d7710052d771005d7771005d7771005777710057777100577771005776710057677100577771005777710057777100577771000000000
0052d100005d21000052d1000052d100005d7100005d710000577100005771000057710000577100005771000057710000577100005771000057710000000000
00055000000550000005500000055000000510000005500000055000000550000005500000055000000550000005500000055000000550000005500000000000
00020000002002000002000000020000002002000000200000000200000200000002000000200200000200000002000000200200000020000000020000000000
02022020000220000202202002022020020220000002202002022000020220200202202000022000020220200202202002022000000220200202200000000000
00266200002662000026620000266200002662002026620000266202002662000026620000266200002662000026620000266200202662000026620200000000
02611620226776222267762022677620026776220267762002677620026776200211762022117622226116202261162002671122026711200261162000000000
02711720027117200277112002771120227117200271172002117720021177200211772002117720027117200271172022771120027711200271172000000000
20277202202112000027120200271202002112000021120220217200202172022027720220277200002772020027720200277200002772022027720000000000
02022000000220200202200002022000000220200202200000022020020220000202200000022020020220000202200000022020020220000002202000000000
00002000002000000000200000002000002000000002000000200000000020000000200000200000000020000000200000200000000200000020000000000000
000000000000000000000000000000000000000000000000000000000000000000d1d10000ddd10000ddd10000ddd10000ddd10000ddd10000ddd10000000000
00d1d10000d1d10000d1d10000d1d10000d1d10000d1d10000d1d10000d1d1000d7777100d6666100d6666100d6666100d6666100d6666100d66661000000000
0d1d11100d1771100d1771100d1771100d7771100d7777100d7777100d777710d7777771d6777761d6777761d6777761d6777761d6777761d677776100000000
ddd1d111ddd17111ddd17111dd717711d7717771d7777771d7777771d7777771d7766771d7700771d7700771d7700771d7700771d7700771d770077100000000
dd1d1111dd1d1111dd171111dd177111dd777711dd777711d7777771d77667710d7777100d7777100d7777100d7777100d7777100d7777100d77771000000000
0dd111100dd111100dd171100dd171100dd771100dd771100d7777100d777710001111000011110000d11d0000d11d1000d11d1000d11d1000d10d1000000000
001111000011110000111100001111000011110000111100001111000011110000000000000000000000000000d00d000dd10dd0dd1000dddd1000dd00000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d1000d0d100000dd100000d00000000
__sfx__
000100003452032520305202e5202b520285202552022520205201b52018520165101351011510010100f5100c5100a5100852006520040100451003510015000050000000000000000000000000000100000000
000100002b650366402d65025650206301d6201762015620116200f6100d6100a6100761005610046100361002610026000160000600006000060000600006000000000000000000000000000000000000000000
00010000377500865032550206300d620085200862007620056100465004610026000260001600006200070000700006300060001600016200160001600016200070000700007000070000700007000070000700
000100000961025620006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600
01050000010501605019050160501905001050160501905016050190601b0611b0611b061290001d0001700026000350002d000250001f0002900030000000000000000000000000000000000000000000000000
01050000205401d540205401d540205401d540205401d540225402255022550225502255000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010500001972020720227201b730207301973020740227401b7402074022740227402274000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000001f5501f5501b5501d5501d550205501f5501f5501b5501a5501b5501d5501f5501f5501b5501d5501d550205501f5501b5501a5501b5501d5501f5502755027550255502355023550225502055020550
001000000f5500f5500a5500f5501b530165501b5501b550165500f5500f5500a5500f5500f5500a550055500a5500e5500f5500f550165501b5501b550165501755017550125500f5500f550125501055010550
011000001e5501c5501c550175501e5501b550205501d550225501e55023550205501c55026550265500000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0110000017550145501455010550175500b550195500d5501b5500f5501c550105500455016550165500000000000000000000000000000000000000000000000000000000000000000000000000000000000000
080d00001b0301b0001b0201d0201e0302003020040200401b7001d700227001a7001b7001b700227001b7001b7001d7001b7001b7001b7001d700227001a7001b7001b700167001b7001b7001b7001c7001c700
050d00001f5301f0001f52021520225302453024530245301e7001e70020700237002070022700227001670000000000000000000000000000000000000000000000000000000000000000000000000000000000
010d000022030220002203024030250302703027030270301b0001b0001b0001d0001e00020000200002000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4d1000002b0202b0202b0202b0202b0202b0202b0202b0202b020290202b0202c0202b0202b0202b0202602026020260202702027020270202b0202b0202b0202a0302a0302a0302703027030270302003020030
4d1000002003028030280302c0302a0302a0302a0302703027030270302c0302a030290302e0302e0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010f00001e050000001e0501d0501b0501a0601a0621a062000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
050f00001b540070001b5401a54018540175501755217562075000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000070000700007000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001b50018500185001b5001f5002250022500225001f5001d5001b5001b5001b5001d50024500295001b50018500185001b5002b50029500245001f5001b50018500185001b50000500005000050000500
001000000a5030000000000000000a5030a50000000000000a5030000009500000000a5030000000000075000a5030000000000000000a5030000000000000000a5030000000000000000a503000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60030000333522a352243521e352163520f3520335000350000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
04 04050644
00 07084749
04 090a484a
04 0b0c0d44
00 0e084344
04 0f0a4344
04 10114e44

