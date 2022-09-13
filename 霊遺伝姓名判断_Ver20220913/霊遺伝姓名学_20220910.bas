100 cls 3
110 'コメント
120 '◎変更履歴
130 '初期設定項目
140 '2021.06.01:霊遺伝姓名判断単体版作成開始
150 '霊遺伝姓名判断Light_Ver202105.改.basより
160 '霊遺伝姓名藩の部分だけのソースを移殖
170 'Date:2022.09.10:Ver2021.06.01をVer2022.09.10にアップデートして改変して制作続行
180 'Date 2022.09.12
190 'Date 2022.09.13
200 'Date 2022.09.14:Ver 2022.09.13
210 'バージョン情報
220 'Ver:2021.06.01_09_20
230 'Ver:2021_06_01_09_07
240 'Ver:2021_06_01_09_06
250 'Ver:2021_06_01_08_31
260 'Ver:2021_06_01_08_29
270 'Ver:2021_06_01_08_25
280 'Ver:2021_06_01_08_23
290 'Ver:2021_06_01_08_19
300 'Ver:2021_06_01_06.12
310 'メモリー定義
320 'メモリー確保 文字領域,数値データー
330 clear 4*4000,4*1000000
340 'Version 情報
350 Version$="Ver:2022_09_13"
360 'ファイル読み込み領域　ここから
370 dim buf_lines$(27),buffer_Kiso(4),buffer_Kiso2(4)
380 '定数文字1画〜27画
390 'ファイルから各画数を読み込んで代入する。
400 '1行目だけ読み込む
410 open "config/Kanji_data/Mojidata_ReiIden20200911.csv" for input as #2
420 for i=0 to 26
430 input #2,buf_lines$(i)
440 next i
450 close #2
460 Moji_1=val(buf_lines$(0)):Moji_2=val(buf_lines$(1)):Moji_3=val(buf_lines$(2)):Moji_4=val(buf_lines$(3)):Moji_5=val(buf_lines$(4)):Moji_6=val(buf_lines$(5)):Moji_7=val(buf_lines$(6)):Moji_8=val(buf_lines$(7)):Moji_9=val(buf_lines$(8)):Moji_10=val(buf_lines$(9)):Moji_11=val(buf_lines$(10)):Moji_12=val(buf_lines$(11)):Moji_13=val(buf_lines$(12)):Moji_14=val(buf_lines$(13)):Moji_15=val(buf_lines$(14)):Moji_16=val(buf_lines$(15)):Moji_17=val(buf_lines$(16)):Moji_18=val(buf_lines$(17)):Moji_19=val(buf_lines$(18)):Moji_20=val(buf_lines$(19)):Moji_21=val(buf_lines$(20)):Moji_22=val(buf_lines$(21)):Moji_23=val(buf_lines$(22)):Moji_24=val(buf_lines$(23)):Moji_25=val(buf_lines$(24)):Moji_26=val(buf_lines$(25)):Moji_27=val(buf_lines$(26))
470 Moji_total=Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+Moji_23+Moji_24+Moji_25+Moji_26+Moji_27
480 '1画
490 Moji_Min_1 = 28:Moji_Max_1 = Moji_1 + 27+1:
500 '2画
510 Moji_Min_2 = (Moji_1) + 27+2:Moji_Max_2 = Moji_1 + Moji_2+27+2
520 '3画
530 Moji_Min_3 =(Moji_1) + (Moji_2) + 27+3:Moji_Max_3 =Moji_1 + Moji_2 + Moji_3+27+3
540 '4画
550 Moji_Min_4 = (Moji_3) + Moji_2 + Moji_1 + 27+4:Moji_Max_4=Moji_1+Moji_2 + Moji_3 + Moji_4 + 27+4
560 '5画
570 Moji_Min_5 = (Moji_1 + Moji_2 + Moji_3 + Moji_4) + 27+5:Moji_Max_5 = (Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5)+27+5
580 '6画
590 Moji_Min_6 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5)+27+6:Moji_Max_6=(Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6)+27+6
600 '7画
610 Moji_Min_7 = (Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6) + 27+7:Moji_Max_7 = (Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6 + Moji_7) + 27+7
620 '8画
630 Moji_Min_8 = Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+27+8:Moji_Max_8=(Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6 + Moji_7 + Moji_8)+27+8
640 '9画
650 Moji_Min_9 = Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6 + Moji_7 + Moji_8 + 27+9:Moji_Max_9 = Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6 + Moji_7 + Moji_8 + Moji_9 + 27+9
660 '10画
670 Moji_Min_10 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9)+27+10:Moji_Max_10=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10)+27+10
680 '11画
690 Moji_Min_11 = (Moji_1+Moji_2+Moji_3+Moji_4 + Moji_5 + Moji_6 + Moji_7 + Moji_8 + Moji_9 + Moji_10)+27+11:Moji_Max_11=(Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6 + Moji_7 + Moji_8 + Moji_9 + Moji_10 + Moji_11)+27+11
700 '12画
710 Moji_Min_12 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11)+27+12:Moji_Max_12=Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+27+12
720 '13画
730 Moji_Min_13=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12)+13+27:Moji_Max_13=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13)+27+13
740 '14画
750 Moji_Min_14 =(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13)+14+27:Moji_Max_14=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14)+14+27
760 '15画
770 Moji_Min_15 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14)+15+27:Moji_Max_15=(Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6+ Moji_7 + Moji_8 + Moji_9+ Moji_10 + Moji_11 + Moji_12+Moji_13+Moji_14+Moji_15)+15+27
780 '16画
790 Moji_Min_16 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15)+16+27:Moji_Max_16=Moji_1 + Moji_2 + Moji_3 + Moji_4 + Moji_5 + Moji_6 + Moji_7 + Moji_8 + Moji_9 + Moji_10 + Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+16+27
800 '17画
810 Moji_Min_17 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16) + 17+27:Moji_Max_17 = Moji_1 + Moji_2 + Moji_3 + Moji_4+Moji_5 + Moji_6 + Moji_7+Moji_8 + Moji_9 + Moji_10 + Moji_11 + Moji_12 + Moji_13 + Moji_14 + Moji_15+Moji_16+Moji_17+17+27
820 '18画
830 Moji_Min_18 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17)+18+27:Moji_Max_18 = (Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18)+18+27
840 '19画
850 Moji_Min_19=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18)+19+27:Moji_Max_19=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19)+19+27
860 '20画
870 Moji_Min_20=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19)+20+27:Moji_Max_20=Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+20+27
880 '21画
890 Moji_Min_21=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20)+21+27:Moji_Max_21=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21)+21+27
900 '22画
910 Moji_Min_22=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21)+22+27:Moji_Max_22=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22)+22+27
920 '23画
930 Moji_Min_23=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+23+27):Moji_Max_23=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+Moji_23)+23+27
940 '24画
950 Moji_Min_24=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+Moji_23)+24+27:Moji_Max_24=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+Moji_23+Moji_24)+24+27
960 '25画
970 Moji_Min_25=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+Moji_23+Moji_24)+25+27:Moji_Max_25=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+Moji_23+Moji_24+Moji_25)+25+27
980 '26画
990 Moji_Min_26=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+Moji_23+Moji_24+Moji_25)+26+27:Moji_Max_26=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+Moji_23+Moji_24+Moji_25+Moji_26)+26+27
1000 '27画
1010 Moji_Min_27=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+Moji_23+Moji_24+Moji_25+Moji_26)+27+27:Moji_Max_27=(Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+Moji_23+Moji_24+Moji_25+Moji_26+Moji_27)+27+27
1020 dim Moji_data$(Moji_total+27+27)
1030 'dim bufmoji$(10),Input_data$(10)
1040 '１画の文字   サイズ:21+2(漢字)
1050 dim buf_char_hiragana1$(Moji_1)
1060 '2画の文字  サイズ 58+14=72(漢字)
1070 dim buf_char_hiragana2$(Moji_2)
1080 '3画の文字 サイズ:48+29=77(漢字)
1090 dim buf_char_hiragana3$(Moji_3)
1100 '4画の文字 サイズ:29+51=80(漢字)
1110 dim buf_char_hiragana4$(Moji_4)
1120 '５画の文字  サイズ:18+59=77(漢字)
1130 dim buf_char_hiragana5$(Moji_5)
1140 '6画の文字  サイズ:79(漢字)
1150 dim buf_char_hiragana6$(Moji_6)
1160 '7画の文字  サイズ:88(漢字)
1170 dim buf_char_hiragana7$(Moji_7)
1180 '8画の文字
1190 dim buf_char_hiragana8$(Moji_8)
1200 '9画の文字
1210 dim buf_char_hiragana9$(Moji_9)
1220 '10画の文字 98文字
1230 dim buf_char_hiragana10$(Moji_10)
1240 '11画の文字
1250 dim buf_char_hiragana11$(Moji_11)
1260 '12画の文字
1270 dim buf_char_hiragana12$(Moji_12)
1280 '13画の文字 81文字
1290 dim buf_char_hiragana13$(Moji_13)
1300 '14画の文字
1310 dim buf_char_hiragana14$(Moji_14)
1320 '15画の文字
1330 dim buf_char_hiragana15$(Moji_15)
1340 '16画の文字
1350 dim buf_char_hiragana16$(Moji_16)
1360 '17画の文字
1370 dim buf_char_hiragana17$(Moji_17)
1380 '18画の文字
1390 dim buf_char_hiragana18$(Moji_18)
1400 '19画の文字
1410 dim buf_char_hiragana19$(Moji_19)
1420 '20画の文字
1430 dim buf_char_hiragana20$(Moji_20)
1440 '21画の文字
1450 dim buf_char_hiragana21$(Moji_21)
1460 '22画の文字
1470 dim buf_char_hiragana22$(Moji_22)
1480 '23画の文字
1490 dim buf_char_hiragana23$(Moji_23)
1500 '24画の文字
1510 dim buf_char_hiragana24$(Moji_24)
1520 '25
1530 dim buf_char_hiragana25$(Moji_25)
1540 dim buf_char_hiragana26$(Moji_26)
1550 dim buf_char_hiragana27$(Moji_27)
1560 '結果表示1　吉凶データー 81パターン
1570 'ファイル読み込み2
1580 'データー読み込み　ここから
1590 'データー読み込み　1.ひらがな
1600 '1画の文字   6文字 23文字
1610 open "config/Kanji_data/Mojidata_ReiIden20200911.csv" for input as #1
1620 '全ファイルを読み込む
1630 for i = 0 to 25+Moji_total+27
1640 input #1,Moji_data$(i)
1650 next i
1660 close #1
1670 '全ファイル読み込み　ここまで
1680 for i = 27+1 to (Moji_1)+27+1
1690 '1画の文字にデーターをコピーする
1700 buf_char_hiragana1$(i-Moji_Min_1) = Moji_data$(i)
1710 next i
1720 '2画の文字    98文字
1730 for i = Moji_Min_2  to (Moji_Max_2)
1740 buf_char_hiragana2$(i-Moji_Min_2)=Moji_data$(i)
1750 next i
1760 '3文字の文字    77文字
1770 for i = Moji_Min_3  to (Moji_Max_3)
1780 buf_char_hiragana3$(i-(Moji_Min_3)) = Moji_data$(i)
1790 next i
1800 '4文字の文字   80文字
1810 for i = (Moji_Min_4)  to (Moji_Max_4)
1820 buf_char_hiragana4$(i-Moji_Min_4)=Moji_data$(i)
1830 next i
1840 '5文字の文字 77文字
1850 for i = Moji_Min_5 to (Moji_Max_5)
1860 buf_char_hiragana5$(i - Moji_Min_5)=Moji_data$(i)
1870 next i
1880 '6文字の文字 79文字
1890 for i = Moji_Min_6  to Moji_Max_6
1900 buf_char_hiragana6$(i-Moji_Min_6) = Moji_data$(i)
1910 next i
1920 '7文字の文字 170文字
1930 for i = Moji_Min_7 to Moji_Max_7
1940 buf_char_hiragana7$(i-Moji_Min_7)=  Moji_data$(i)
1950 next i
1960 '8画の文字 120文字
1970 for i = Moji_Min_8 to Moji_Max_8
1980 buf_char_hiragana8$(i - Moji_Min_8)=Moji_data$(i)
1990 next i
2000 '9画の文字  103文字
2010 for i = Moji_Min_9 to Moji_Max_9
2020 buf_char_hiragana9$(i - Moji_Min_9)=Moji_data$(i)
2030 next i
2040 '10画の文字 285文字
2050 for i = Moji_Min_10 to (Moji_Max_10)
2060 buf_char_hiragana10$(i-Moji_Min_10)=Moji_data$(i)
2070 next i
2080 '11画の文字
2090 for i = Moji_Min_11 to Moji_Max_11
2100 buf_char_hiragana11$(i-Moji_Min_11) = Moji_data$(i)
2110 next i
2120 '12画の文字
2130 for i = Moji_Min_12 to Moji_Max_12
2140 buf_char_hiragana12$(i-Moji_Min_12)=Moji_data$(i)
2150 next i
2160 '13画の文字 81
2170 for i = Moji_Min_13 to Moji_Max_13
2180 buf_char_hiragana13$(i-Moji_Min_13) = Moji_data$(i)
2190 next i
2200 '14画の文字 66
2210 for i = Moji_Min_14 to Moji_Max_14
2220 buf_char_hiragana14$(i-Moji_Min_14)=Moji_data$(i)
2230 next i
2240 '15画の文字 59
2250 'for i = Moji_Min_15 to (Moji_Max_15) - 1
2260 for i=Moji_Min_15 to  Moji_Max_15
2270 buf_char_hiragana15$(i-Moji_Min_15)=Moji_data$(i)
2280 next i
2290 '16画の文字 44
2300 for i=Moji_Min_16 to Moji_Max_16
2310 buf_char_hiragana16$(i-Moji_Min_16)=Moji_data$(i)
2320 next i
2330 '17画の文字
2340 for i = Moji_Min_17 to Moji_Max_17
2350 buf_char_hiragana17$(i-Moji_Min_17)=Moji_data$(i)
2360 next i
2370 '18画の文字
2380 for i = Moji_Min_18 to Moji_Max_18
2390 buf_char_hiragana18$(i-Moji_Min_18)=Moji_data$(i)
2400 next i
2410 '19画の文字 17文字
2420 for i = Moji_Min_19 to Moji_Max_19
2430 buf_char_hiragana19$(i-Moji_Min_19)=Moji_data$(i)
2440 next i
2450 '20 画の文字 13文字
2460 for  i = Moji_Min_20 to Moji_Max_20
2470 buf_char_hiragana20$(i-Moji_Min_20)=Moji_data$(i)
2480 NEXT i
2490 '21画の文字 6
2500 for i = Moji_Min_21 to (Moji_Max_21)
2510 buf_char_hiragana21$(i-Moji_Min_21)=Moji_data$(i)
2520 next i
2530 '22 画の文字 4
2540 for i = Moji_Min_22 to Moji_Max_22
2550 buf_char_hiragana22$(i-Moji_Min_22)=Moji_data$(i)
2560 next i
2570 '23画の文字  3文字
2580 for i = Moji_Min_23 to Moji_Max_23
2590 buf_char_hiragana23$(i-Moji_Min_23)=Moji_data$(i)
2600 next i
2610 '24画の文字  3文字
2620 for i = Moji_Min_24 to Moji_Max_24
2630 buf_char_hiragana24$(i-Moji_Min_24)=Moji_data$(i)
2640 next i
2650 '25 画の文字 4
2660 for i = Moji_Min_25 to Moji_Max_25
2670 buf_char_hiragana25$(i-Moji_Min_25)=Moji_data$(i)
2680 next i
2690 '26画の文字  3文字
2700 for i = Moji_Min_26 to Moji_Max_26
2710 buf_char_hiragana26$(i-Moji_Min_26)=Moji_data$(i)
2720 next i
2730 '27画の文字  3文字
2740 for i = Moji_Min_27 to Moji_Max_27
2750 buf_char_hiragana27$(i-Moji_Min_27)=Moji_data$(i)
2760 next i
2770 'ファイル読み込み領域　ここまで
2780 '相性占い結果パターン ここまで
2790 'メイン画面　ここから
2800 '描画領域　ここから
2810 Select_keybord:
2820 cls 3:font 32:screen 1,1,1,1
2830 'line (0,0)-(1200,60),rgb(0,0,255),bf
2840 'pen 5:line (0,0)-(1197,57),rgb(127,255,212),b
2850 'line (0,60)-(1200,380),rgb(127,255,212),bf
2860 'pen 5:line(0,57)-(1197,377),rgb(0,0,255),b
2870 'line (0,380)-(1200,450),rgb(0,255,0),bf
2880 'pen 5:line(0,377)-(1197,447),rgb(0,0,255),b
2890 gload "config/Picture/Top_Screen1.png",0,0,0
2900 gload "config/img/Selection.png",1,1,60
2910 gload "config/img/Selection.png",1,1,125
2920 gload "config/img/Selection.png",1,1,190
2930 sp_def 0,(1,60),32,32
2940 sp_def 1,(1,125),32,32
2950 sp_def 2,(1,190),32,32
2960 sp_on 0,1:sp_on 1,0:sp_on 2,0
2970 sp_put 0,(1,60),0,0:sp_on 1,(1,120),1,0:sp_on 2,(1,190),2,0
2980 '描画領域　ここまで
2990 '設定画面 バーチャルキーボードの表示選択
3000 talk"キーボードの選択です。バーチャルキーボードを表示させますか？"
3010 'color rgb(255,255,255)
3020 'print "●バーチャル キーボードの表示の選択"+chr$(13)
3030 No=0
3040 print chr$(13)
3050 color rgb(255,0,255)
3060 print " 1.バーチャルキーボードを表示する"+chr$(13)
3070 print " 2.バーチャルキーボードを表示しない"+chr$(13)
3080 print " 3.プログラムを終了する"+chr$(13)
3090 locate 1,8
3100 color rgb(0,0,0)
3110 print "1.バーチャルキーボードを表示するを選択"+chr$(13)
3120 key1$:
3130 key$ = input$(1)
3140 if key$=chr$(31) then
3150 select case No
3160 case 0:
3170        No=1:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_put 1,(1,120),1,0:locate 1,8:print"                                   ":locate 1,8:print "2.バーチャルキーボードを表示しないを選択":goto key1$:
3180 case 1:
3190        No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_put 2,(1,190),2,0:locate 1,8:print "                                                  ":locate 1,8:print"3.プログラムを終了するを選択":goto key1$:
3200 case 2:
3210        No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_put 0,(1,60),0,0:locate 1,8:print "                                                          ":locate 1,8:print "1.バーチャルキーボードを表示するを選択":goto key1$:
3220 end select
3230 else
3240 if key$=chr$(13) then
3250 select case No
3260 case 0:
3270        sp_on 0,0:init "kb:2":goto Main_Screen:
3280 case 1:
3290        sp_on 1,0 :init "kb:0":goto Main_Screen:
3300 case 2:
3310        color rgb(255,255,255):cls 3:cls 4:end
3320 end select
3330 else
3340 goto key1$:
3350 endif
3360 endif
3370 'input"番号:",keyNo
3380 'if keyNo = 1 then init"kb:2"
3390 'if keyNo = 2 then init"kb:0"
3400 'if keyNo = 3 then color rgb(255,255,255):cls 3:end
3410 'if keyNo > 3 or keyNo = 0 then goto Select_keybord:
3420 'メイン画面 Top画面1
3430 Main_Screen:
3440 cls 3:font 48:color rgb(255,255,255),,rgb(176,196,222):No=0
3450 talk "メイン画面です、番号を選んで、エンターキーを押してください"
3460 'Text ,Grapgic clear:cls 3
3470 'グラフィック領域　ここから
3480 'line (0,0)-(570,60),rgb(0,0,255),bf
3490 'pen 5:line (0,0)-(567,57),rgb(127,255,212),b
3500 'line (0,60)-(570,460),rgb(127,255,212),bf
3510 'pen 5:line (0,57)-(567,457),rgb(0,0,255),b
3520 'line (0,460)-(570,640),rgb(0,255,0),bf
3530 'グラフィック領域 ここまで
3540 'pen 5:line (0,457)-(567,637),rgb(0,0,255),b
3550 gload "config/Picture/Main_Screen1.png",0,0,0
3560 gload "config/img/Selection.png",1,1,255
3570 gload "config/img/Selection.png",1,1,320
3580 Font 32
3590 sp_def 2,(1,190),32,32:Sp_def 3,(1,255),32,32:sp_def 4,(1,320),32,32
3600 sp_on 2,0:sp_on 3,0:sp_on 4,0
3610 'print"◎姓名判断　メイン画面"+chr$(13)
3620 '文字色:黒
3630 print chr$(13)
3640 color rgb(255,0,255)
3650 print" 1.姓名判断"+chr$(13)
3660 print" 2.姓名判断の漢字" + chr$(13)
3670 print" 3.設定"+chr$(13)
3680 print" 4.ヘルプ"+chr$(13)
3690 print" 5.プログラムの終了"+chr$(13)
3700 No=0:locate 1,14:print "1.姓名判断を選択"
3710 sp_on 0,1:sp_put 0,(1,60),0,0
3720 key2$:
3730 key$=input$(1)
3740 if key$=chr$(31) then
3750 select case No
3760 case 0:
3770        No=1:sp_on 0,0:sp_on 1,1:sp_on 2,0:sp_put 1,(1,120),0,0:locate 1,14:print"                                                          ":locate 1,14:print "2.姓名判断の漢字を選択":goto key2$:
3780 case 1:
3790        No=2:sp_on 0,0:sp_on 1,0:sp_on 2,1:sp_put 2,(1,190),0,0:locate 1,14:print "                                                          ":locate 1,14:print"3.設定を選択":goto key2$:
3800 case 2:
3810        No=3:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,1:sp_put 3,(1,255),0,0:locate 1,14:print "                                                 ":locate 1,14:print"4.ヘルプを選択":goto key2$:
3820 case 3:
3830        No=4:sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 4,1:sp_put 4,(1,320),0,0:locate 1,14:print "                                                       ":locate 1,14:print "5.プログラムを終了を選択":goto key2$:
3840 'end select
3850 case 4:
3860       No=0:sp_on 0,1:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 4,0:sp_put 0,(1,60),0,0:locate 1,14:print "                             ":locate 1,14:print"1.姓名判断を選択":goto key2$:
3870 end select
3880 else
3890 if key$ = chr$(13) then
3900 select case No
3910 case 0:
3920        sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 4,0:goto seimeihandan_top:
3930 case 1:
3940        sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 4,0:goto seimeihandan_setting:
3950 case 2:
3960        sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 4,0:goto Settei_Koumoku:
3970 case 3:
3980      sp_on 0,0:sp_on 1,0:sp_on 2,0:sp_on 3,0:sp_on 4,0:goto help:
3990 case 4:
4000      cls 3:cls 4:end
4010 end select
4020 else
4030 goto key2$:
4040 endif
4050 endif
4060 'print"5.プログラム終了"+chr$(13)
4070 '文字:黒
4080 color rgb(0,0,0)
4090 'print"番号を選んでください"+chr$(13)
4100 print chr$(13)
4110 'Input "番号:",No
4120 'if No = 1  then goto seimeihandan_top:
4130 'if No = 2 then goto seimeihandan_setting:
4140 'if No = 4 then goto help:
4150 'if No = 5  then talk"終了します":cls 3:end
4160 'if No = 3 then goto Settei_Koumoku:
4170 'if  No > 5 or No = 0  then ui_msg"無効な番号です、もう一度入れ直してください。":goto Main_Screen:
4180 '1.姓名判断トップ画面
4190 seimeihandan_top:
4200 cls:screen 1,1,1,1
4210 'タイトル文字:白
4220 font 48:color rgb(255,255,255),,rgb(176,196,222)
4230 talk "姓名判断トップメニューです。姓名判断の種類の番号を選んでエンターキーを押してください"
4240 'グラフィック 描画領域　ここから
4250 'Main_Screen:
4260 cls 3:font 32
4270 '1.Title:青
4280 'Line 1
4290 'line (0,0)-(890,60),rgb(0,0,255),bf
4300 'pen 5:line(0,0)-(887,57),rgb(127,255,212),b
4310 'Line 2
4320 'line (0,60)-(890,265),rgb(127,255,212),bf
4330 'PEN 5:line(0,57)-(887,262),rgb(0,0,255),b
4340 'Line 3
4350 'line (0,265)-(890,400),rgb(0,255,0),bf
4360 'pen 5:line (0,262)-(887,397),rgb(0,0,0),b
4370 gload "config/Picture/seimeihandan_Select_top.png"
4380 'グラフィック 描画領域 ここまで
4390 color rgb(255,255,255)
4400 'print"◎姓名判断の種類トップメニュー"+chr$(13)
4410 print chr$(13)+chr$(13)
4420 color rgb(255,0,255):print"1.霊遺伝姓名学" + chr$(13)
4430 COLOR rgb(255,0,255):print"2.前の画面に戻る" + chr$(13)
4440 'color rgb(0,0,0):Print"番号を選んでエンターを押してください"
4450 print chr$(13)
4460 color rgb(0,0,0):Input"番号:",selectNo
4470 IF selectNo = 1 then goto Reiden_Top_Input_Sextype:
4480 if selectNo = 2 then goto Main_Screen:
4490 if selectNo > 2 or selectNo = 0 then ui_msg"無効な番号です。入れ直してください。":goto seimeihandan_top:
4500 '2.設定
4510 seimeihandan_setting:
4520 font 48:color rgb(0,0,0),,rgb(176,196,222)
4530 talk"設定画面です。番号を選んでエンターキーを押してください"
4540 'グラフィック領域　ここから
4550 cls 3:
4560 'line (0,0)-(750,60),rgb(0,0,255),bf
4570 'pen 5:line (0,0)-(747,57),rgb(127,255,212),b
4580 'line (0,60)-(750,460),rgb(127,255,212),bf
4590 'pen 5:line (0,57)-(747,457),rgb(0,0,255),b
4600 'line (0,460)-(750,650),rgb(0,255,0),bf
4610 'pen 5:line(0,457)-(747,647),rgb(0,0,255),b
4620 'グラフィック領域 ここまで
4630 '1行目　文字色　 白
4640 'color rgb(255,255,255):print"姓名判断　設定画面トップ画面" + chr$(13)
4650 gload "config/Picture/Setting_Top.png"
4660 print chr$(13)
4670 color rgb(255,0,255):print"1.登録文字の確認" + chr$(13)
4680 color rgb(255,0,255):print"2.登録文字数の表示" + chr$(13)
4690 color rgb(255,0,255):print"3.前の画面に戻る" + chr$(13)
4700 color rgb(255,0,255):print"4.プログラムの終了" + chr$(13)
4710 COLOR rgb(0,0,0)
4720 'print"番号を選んでください"+chr$(13)
4730 print chr$(13)
4740 Input"番号:",selectNo
4750 if selectNo=1 then goto Entry_moji_Top:
4760 if selectNo=2 then goto Entry_moji_check_count:
4770 if selectNo=3 then goto Main_Screen:
4780 if selectNo=4 then talk"終了します":cls 3:end
4790 if selectNo > 4 or selectNo = 0 then goto seimeihandan_setting:
4800 '３．設定  ここから
4810 Settei_Koumoku:
4820 cls 3:font 32:talk "設定項目です。番号を選んでエンターキーを押してください。"
4830 gload "config/Picture/Settei_Screen.png"
4840 print chr$(13) + chr$(13)
4850 'color rgb(0,0,255)
4860 'print "姓名判断 設定" + chr$(13) + chr$(13) + chr$(13)
4870 color rgb(255,0,255)
4880 print "1.名前リスト 表示"  + chr$(13)
4890 print "2.名前リスト 編集"  + chr$(13)
4900 print "3.前の画面に行く" + chr$(13)
4910 print "4.プログラムの終了" + chr$(13)
4920 color rgb(0,0,0)
4930 print "番号を選んでください" + chr$(13)
4940 Input "番号:",No
4950 if No=3 then
4960  goto Main_Screen:
4970 else
4980 if No=4 then
4990 talk "終了します":cls 3:end
5000 else
5010  goto Settei_Koumoku:
5020 endif
5030 endif
5040 '3.設定  ここまで
5050 '3 番号で吉凶を見る 入力
5060 Moji_Kikkyo_Top:
5070 font 32:color rgb(0,0,0),,rgb(176,196,222)
5080 'グラフィック描画領域　ここから
5090 cls 3
5100 line (0,0)-(650,60),rgb(0,0,255),bf
5110 pen 5:line(0,0)-(645,57),rgb(127,255,212),b
5120 line (0,60)-(650,255),rgb(127,255,212),bf
5130 PEN 5:line(0,57)-(647,252),rgb(0,0,255),b
5140 line (0,255)-(650,350),rgb(0,255,0),bf
5150 pen 5:line(0,252)-(647,347),rgb(0,0,255),b
5160 'グラフィック描画領域 ここまで
5170 color rgb(255,255,255)
5180 print"画数での吉凶判定"+chr$(13)
5190 color rgb(255,0,255)
5200 print"画数を入れてください"+chr$(13)
5210 print"(Max:81文字)"+chr$(13)
5220 color rgb(0,0,0)
5230 Input"文字の画数:",Number
5240 if Number > 81 then goto Moji_Kikkyo_Top:
5250 if Number <=81 then end
5260 '3.番号で吉凶を見る 結果表示
5270 'グラフィック描画領域　ここから
5280 Entry_moji_check:
5290 cls 3
5300 '1行目
5310 line (0,0)-(840,58),rgb(0,0,255),bf
5320 pen 5:line(0,0)-(837,55),rgb(127,255,212),b
5330 '2行目
5340 line (0,58)-(840,100),rgb(127,255,212),bf
5350 PEN 5:line(0,55)-(837,97),rgb(0,0,0),b
5360 '3行目
5370 line (0,100)-(840,280),rgb(0,0,255),bf
5380 pen 5:LINE(0,103)-(837,277),rgb(127,255,212),b
5390 '4行目
5400 line (0,280)-(840,340),rgb(0,255,0),bf
5410 pen 5:line(0,277)-(837,337),rgb(0,0,0),b
5420 'グラフィック描画領域　ここまで
5430 totalmoji=Moji_1+Moji2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_22+Moji_23+Moji_24
5440 color rgb(255,255,255):print "登録文字画数結果表示"
5450 talk "この文字は"+ str$(buffer_count) +"かくでとうろくされています":color rgb(255,0,255):print name$;":";buffer_count;"画で登録されています":
5460 'endif
5470 color rgb(255,255,255)
5480 print"q+エンターキー:トップ画面"+chr$(13)
5490 print"エンターキー:もう一度やる"+chr$(13)
5500 color rgb(0,0,0)
5510 print"コマンド:"
5520 key$=Input$(1)
5530 if key$=chr$(13)  then buffer_count=0:goto Entry_moji_Top:
5540 if key$="q" then buffer_count=0:goto Main_Screen:
5550 if not(key$="q") then goto Moji_count_check:
5560 Entry_moji_Top:
5570 cls 3:font 48
5580 'cls 3:line (0,0)-(1050,65),rgb(0,0,255),bf
5590 'pen 5:line(0,0)-(1047,62),rgb(127,255,212),b
5600 'line (0,62)-(1050,155),rgb(0,255,255),bf
5610 'pen 5:line(0,59)-(1047,152),rgb(0,0,255),b
5620 'line (0,155)-(1050,260),rgb(0,255,0),bf
5630 'pen 5:line(0,152)-(1047,257),rgb(0,0,255),b
5640 gload "config/Picture/Input_Entry_Moji2.png"
5650 'グラフィック領域　ここまで
5660 talk"調べたい文字をひと文字入れてください。"
5670 '文字:白
5680 'olor rgb(255,255,255):print"登録文字の確認"+chr$(13)
5690 '文字:アクア
5700 'color rgb(255,0,0):print"文字を入力してエンターキーを押してください"+chr$(13)
5710 print chr$(13)+chr$(13)+chr$(13)+chr$(13)
5720 color rgb(0,0,0):Input"登録文字を入れてください(1文字):",name$
5730 if name$="" then ui_msg"文字が空白です。入れ直してください。":goto Entry_moji_Top:
5740 if (len(name$)>1) then ui_msg("１文字で入れてください"):goto Entry_moji_Top:
5750 '1画の文字
5760 for i=0 to ((Moji_1)-1)
5770 if (name$=buf_char_hiragana1$(i)) then
5780 buffer_count=1:goto Moji_count_check:
5790 endif
5800 next i
5810 '2画の文字
5820 for i=0 to ((Moji_2)-1)
5830 if (name$=buf_char_hiragana2$(i)) then
5840 buffer_count=2:goto Moji_count_check:
5850 endif
5860 next i
5870 '3画の文字
5880 for i=0 to ((Moji_3)-1)
5890 if (name$=buf_char_hiragana3$(i)) then
5900 buffer_count=3:goto Moji_count_check:
5910 endif
5920 next i
5930 '4画の文字
5940 for i=0 to ((Moji_4)-1)
5950 if (name$=buf_char_hiragana4$(i)) then
5960 buffer_count=4:goto Moji_count_check:
5970 endif
5980 next i
5990 '5画の文字
6000 for i=0 to ((Moji_5)-1)
6010 if (name$=buf_char_hiragana5$(i)) then
6020 buffer_count=5:goto Moji_count_check:
6030 endif
6040 next i
6050 '6画の文字
6060 for i=0 to ((Moji_6)-1)
6070 if (name$=buf_char_hiragana6$(i)) then
6080 buffer_count=6:goto Moji_count_check:
6090 endif
6100 next i
6110 '7画の文字
6120 for i=0 to ((Moji_7)-1)
6130 if (name$=buf_char_hiragana7$(i)) then
6140 buffer_count=7:goto Moji_count_check:
6150 endif
6160 next i
6170 '8画の文字 120 文字
6180 for i=0 to ((Moji_8)-1)
6190 if (name$=buf_char_hiragana8$(i)) then
6200 buffer_count=8:goto Moji_count_check:
6210 endif
6220 next i
6230 '9画の文字  103文字
6240 for i=0 to ((Moji_9)-1)
6250 if (name$=buf_char_hiragana9$(i)) then
6260 buffer_count=9:goto Moji_count_check:
6270 endif
6280 next i
6290 '10画の文字 98文字
6300 for i=0 to ((Moji_10)-1)
6310 if (name$=buf_char_hiragana10$(i)) then
6320 buffer_count=10:goto Moji_count_check:
6330 endif
6340 next i
6350 '11画の文字 98文字
6360 for i=0 to ((Moji_11)-1)
6370 if (name$=buf_char_hiragana11$(i)) then
6380 buffer_count=11:goto Moji_count_check:
6390 endif
6400 next i
6410 '12画の文字
6420 for i=0 to ((Moji_12)-1)
6430 if (name$=buf_char_hiragana12$(i)) then
6440 buffer_count=12:goto Moji_count_check:
6450 endif
6460 next i
6470 '13画の文字
6480 for i=0 to ((Moji_13)-1)
6490 if (name$=buf_char_hiragana13$(i)) then
6500 buffer_count=13:goto Moji_count_check:
6510 endif
6520 next i
6530 '14画の文字
6540 for i=0 to ((Moji_14)-1)
6550 if (name$=buf_char_hiragana14$(i)) then
6560 buffer_count=14:goto Moji_count_check:
6570 endif
6580 next i
6590 '15画の文字
6600 for i=0 to ((Moji_15)-1)
6610 if (name$=buf_char_hiragana15$(i)) then
6620 buffer_count=15:goto Moji_count_check:
6630 endif
6640 next i
6650 '16画の文字
6660 for i=0 to ((Moji_16)-1)
6670 if (name$=buf_char_hiragana16$(i)) then
6680 buffer_count=16:goto Moji_count_check:
6690 endif
6700 next i
6710 '17画の文字
6720 for i=0 to ((Moji_17)-1)
6730 if (name$=buf_char_hiragana17$(i)) then
6740 buffer_count=17:goto Moji_count_check:
6750 endif
6760 next i
6770 '18画の文字 25
6780 for i=0 to ((Moji_18)-1)
6790 if (name$=buf_char_hiragana18$(i)) then
6800 buffer_count=18:goto Moji_count_check:
6810 endif
6820 next i
6830 '19画の文字 17
6840 for i=0 to ((Moji_19)-1)
6850 if (name$=buf_char_hiragana19$(i)) then
6860 buffer_count=19:goto Moji_count_check:
6870 endif
6880 next i
6890 '20画の文字 13
6900 for i=0 to ((Moji_20)-1)
6910 if (name$=buf_char_hiragana20$(i)) then
6920 buffer_count=20:goto Moji_count_check:
6930 endif
6940 next i
6950 '21画の文字 6
6960 for i=0 to ((Moji_21)-1)
6970 if (name$=buf_char_hiragana21$(i)) then
6980 buffer_count=21:goto Moji_count_check:
6990 endif
7000 next i
7010 '22画の文字 4
7020 for i=0 to ((Moji_22)-1)
7030 if (name$=buf_char_hiragana22$(i)) then
7040 buffer_count=22:goto Moji_count_check:
7050 endif
7060 next i
7070 '23画の文字 3
7080 for i=0 to ((Moji_23)-1)
7090 if (name$=buf_char_hiragana23$(i)) then
7100 buffer_count=23:goto Moji_count_check:
7110 endif
7120 next i
7130 '24画の文字
7140 for i=0 to ((Moji_24)-1)
7150 if (name$=buf_char_hiragana24$(i)) then
7160 buffer_count=24:goto Moji_count_check:
7170 endif
7180 next i
7190 'Menu3 結果表示 画数の登録確認
7200 Moji_count_check:
7210 if (buffer_count = 0) then
7220 '登録文字がない場合の処理
7230 'グラフィック領域　ここから
7240 'Moji_count_check:
7250 cls 3:font 48
7260 '1行
7270 'ine (0,0)-(840,60),rgb(0,0,255),bf
7280 'pen 5:line (0,0)-(837,57),rgb(127,255,212),b
7290 '2行目
7300 'line (0,60)-(840,165),rgb(127,255,212),bf
7310 'pen 5:line (0,57)-(837,162),rgb(0,0,255),b
7320 '3行目
7330 'line (0,165)-(840,370),rgb(0,0,255),bf
7340 'pen 5:line (0,162)-(837,367),rgb(0,255,0),b
7350 '4行目
7360 'line (0,370)-(840,450),rgb(0,255,0),bf
7370 'pen 5:line(0,367)-(837,447),rgb(0,0,0),b
7380 'グラフィック領域　ここまで
7390 color rgb(255,255,255):print"登録文字数結果確認"+chr$(13)
7400 color rgb(255,0,0):print name$;":この文字は、登録されていません"+chr$(13)
7410 talk "この文字は、登録されていません"
7420 color rgb(255,255,255):print"q:トップ画面"+chr$(13)
7430 COLOR rgb(255,255,255):print"エンターキー:もう一度調べる"+chr$(13)
7440 color rgb(0,0,0):print"コマンド:"
7450 key$ = Input$(1)
7460 if key$ = "q" or key$ = "Q" then goto Main_Screen:
7470 if key$ = chr$(13) then goto Entry_moji_Top:
7480 else
7490 'グラフィック描画領域　ここから
7500 'Entry_moji_check:
7510 cls 3
7520 '1行目
7530 'line (0,0)-(840,58),rgb(0,0,255),bf
7540 'pen 5:line(0,0)-(837,55),rgb(127,255,212),b
7550 '2行目
7560 'line (0,58)-(840,100),rgb(127,255,212),bf
7570 'PEN 5:line(0,55)-(837,97),rgb(0,0,0),b
7580 '3行目
7590 'line (0,100)-(840,280),rgb(0,0,255),bf
7600 'pen 5:LINE(0,103)-(837,277),rgb(127,255,212),b
7610 '4行目
7620 'line (0,280)-(840,340),rgb(0,255,0),bf
7630 'pen 5:line(0,277)-(837,337),rgb(0,0,0),b
7640 'グラフィック描画領域　ここまで
7650 'color rgb(255,255,255):print "登録文字画数結果表示"
7660 gload "config/Picture/Result_EntryMoji2.png"
7670 print chr$(13)
7680 talk "この文字は"+ str$(buffer_count) +"かくでとうろくされています":color rgb(255,0,255):print name$;":";buffer_count;"画で登録されています"+chr$(13)
7690 endif
7700 color rgb(0,0,0)
7710 print"qキー:トップ画面"+chr$(13)
7720 print"エンターキー:もう一度やる"+chr$(13)
7730 'color rgb(0,0,0)
7740 'print"コマンド:"
7750 key$=Input$(1)
7760 if key$=chr$(13)  then buffer_count=0:goto Entry_moji_Top:
7770 if key$="q" then buffer_count=0:goto Main_Screen:
7780 if not(key$="q") then goto Moji_count_check:
7790 '
7800 'dif
7810 'グラフィック描画領域　ここから
7820 '登録文字数の確認
7830 Entry_moji_check_count:
7840 totalmoji=Moji_1+Moji_2+Moji_3+Moji_4+Moji_5+Moji_6+Moji_7+Moji_8+Moji_9+Moji_10+Moji_11+Moji_12+Moji_13+Moji_14+Moji_15+Moji_16+Moji_17+Moji_18+Moji_19+Moji_20+Moji_21+Moji_21+Moji_22+Moji_23+Moji_24+Moji_25+Moji_26+Moji_27
7850 'グラフィック描画領域　ここから
7860 cls 3:font 48
7870 '1行目
7880 'ine (0,0)-(800,60),rgb(0,0,255),bf
7890 'en 5:line (0,0)-(797,57),rgb(127,255,212),b
7900 '2行目
7910 'line (0,60)-(800,150),rgb(157,255,212),bf
7920 'pen 5:line(0,57)-(797,147),rgb(0,0,255),b
7930 '3行目
7940 'line (0,150)-(800,250),rgb(0,255,0),bf
7950 'pen 5:line(0,147)-(797,247),rgb(0,0,255),b
7960 'グラフィック描画領域 ここまで
7970 'color rgb(255,255,255)
7980 'PRINT"登録文字数の確認"+chr$(13)
7990 gload "config/Picture/Moji_check.png"
8000 print chr$(13)
8010 color rgb(255,0,255)
8020 PRINT"登録文字数は";totalmoji;"文字です"+chr$(13)
8030 TALK"登録文字数は"+str$(totalmoji)+"もじです"
8040 color rgb(0,0,0)
8050 'print"エンターキーを押してください"+chr$(13)
8060 'key$=Input$(1)
8070 print"エンターキーを押してください"+chr$(13)
8080 key$=Input$(1)
8090 if key$ = chr$(13) then goto Main_Screen:
8100 'グラフィック領域　ここから
8110 '性別入力
8120 Reiden_Top_Input_Sextype:
8130 cls 3:font 48
8140 'Line1
8150 'line (0,0)-(850,60),rgb(0,0,255),bf
8160 'line (0,0)-(847,57),rgb(0,255,0),b
8170 'Line 2
8180 'line (0,63)-(853,537),rgb(127,255,212),bf
8190 'line (0,60)-(850,540),rgb(0,0,0),b
8200 'Line 3
8210 'line (0,540)-(850,630),rgb(0,255,0),bf
8220 'line (0,543)-(853,633),rgb(0,0,255),b
8230 gload "config/Picture/Select_sextype.png"
8240 'グラフィック領域　ここまで
8250 '音声表示
8260 talk "霊遺伝生命学　性別の選択です。占う方の性別を入れてください"
8270 '性別変数:sex_type=0
8280 '文字色： 白
8290 'color rgb(255,255,255):print"霊遺伝姓名学 性別の選択" + chr$(13)
8300 '文字色：赤
8310 print chr$(13)
8320 color rgb(255,0,255)
8330 print"占う人の性別の番号を入れてください" + chr$(13)
8340 'print chr$(13)
8350 print"1.女 性" + chr$(13)
8360 print"2.男 性" + chr$(13)
8370 print"3.前の画面に戻る" + chr$(13)
8380 print"4.終 了" + chr$(13)
8390 'print chr$(13)
8400 color rgb(0,0,0)
8410 Input"番号:",No
8420 '2:男性の場合 名前を入力
8430 '男性の性別:sex_type=2
8440 if No=2 then sex_type=2:talk"":goto ReiIden_Input_male:
8450 '1:女性の場合 既婚の場合、旧姓で入力
8460 '女性の性別:sex_type=1
8470 if No=1 then sex_type=1:talk"":goto ReiIden_Input_female:
8480 '3:終了処理
8490 if No=4 then cls 3:end
8500 if No=3 then goto Main_Screen:
8510 if No >4 then goto Reiden_Top_Input_Sextype:
8520 '１．男性の場合の名前入力
8530 '描画領域　ここから
8540 ReiIden_Input_male:
8550 cls 3
8560 'Line 1 Title
8570 'line (0,0)-(850,60),rgb(0,0,255),bf
8580 'line (0,0)-(850,57),rgb(0,255,0),b
8590 'Line2 Input name
8600 'line (0,60)-(850,300),rgb(0,255,0),bf
8610 'line (0,60)-(850,303),rgb(0,0,255),b
8620 gload "config/Picture/Input_name1_male.png"
8630 '描画領域 ここまで
8640 '文字色：白
8650 talk "名前の入力です。名前の姓の部分を入力してください"
8660 color rgb(255,255,255)
8670 'print "霊遺伝姓名学 名前の姓入力（男性）" + chr$(13)
8680 print chr$(13)
8690 '文字色：黒
8700 color rgb(0,0,0)
8710 print "名前の姓の部分を入れてください" + chr$(13)
8720 Input"名前(姓の部分):",name1$
8730 '名の入力部分
8740 cls 3
8750 gload "config/Picture/Input_name2_male.png"
8760 talk"名前のめいの部分を入れてください"
8770 'color rgb(255,255,255)
8780 'print "霊遺伝姓名学 名前の名入力(男性)" + chr$(13)
8790 print chr$(13)
8800 color rgb(0,0,0)
8810 print "名前の名の部分を入れてください"+chr$(13)
8820 Input"名前(名の部分):",name2$:goto check:
8830 '2.女性の場合　既婚か未婚か確認する
8840 '2-2-1女性の姓の入力
8850 'グラフィック領域　ここから
8860 ReiIden_Input_female:
8870 cls 3:font 48
8880 talk"名前の入力です。名前のせいの部分を入れてください"
8890 'Line1 Title
8900 'line (0,0)-(850,60),rgb(0,0,255),bf
8910 'line (0,0)-(850,57),rgb(0,255,0),b
8920 'Line 2 入力欄
8930 'line (0,60)-(850,360),rgb(0,255,0),bf
8940 'line (0,60)-(850,357),rgb(0,0,255),b
8950 'Line 2 入力欄(名前入力)
8960 'グラフィック領域 ここまで
8970 gload "config/Picture/Input_name1_female.png"
8980 cls:print chr$(13)
8990 'color rgb(255,255,255)
9000 'print "霊遺伝姓名学 名前の姓入力(女性）"+chr$(13)
9010 color rgb(255,0,0)
9020 print"既婚者の方は、旧姓を入れてください"+chr$(13)
9030 color rgb(0,0,0)
9040 print "名前の姓の部分を入れてください"+chr$(13)
9050 Input "名前(姓の部分):",name3$
9060 talk ""
9070 '2-2-2女性の名の入力
9080 cls 3
9090 gload "config/Picture/Input_name2_female.png"
9100 talk"名前のめいの部分を入れてください。"
9110 color rgb(255,255,255)
9120 'print "霊遺伝姓名学 名前の名の部分(女性)"+chr$(13)
9130 print chr$(13)
9140 color rgb(0,0,0)
9150 print "名前の名の部分を入れてください"+chr$(13)
9160 Input "名前(名の部分):",name4$
9170 talk ""
9180 '計算領域　ここから
9190 check:
9200 '苗字の画数:buffer_name1_count
9210 'name1$,name2$:男性
9220 if sex_type = 1 then
9230 'sex_type=1 :女性のとき
9240 buf_male_female_name1$=name3$
9250 buf_male_female_name2$=name4$
9260 endif
9270 if sex_type = 2 then
9280 'sex_type=2 :男性のとき
9290 buf_male_female_name1$=name1$
9300 buf_male_female_name2$=name2$
9310 endif
9320 buffer_name1_count=len(buf_male_female_name1$)
9330 buffer_name2_count=len(buf_male_female_name2$)
9340 select case buffer_name1_count
9350 'AとBを求める
9360 case 1:
9370 '1.苗字の画数が1つのとき
9380 'A:霊数 1
9390 A=1
9400 buf_name1$ = Mid$(buf_male_female_name1$,1,1)
9410 B = char_count(buf_name1$)
9420 case 2:
9430 '2.苗字の画数が2つのとき
9440 '2-1:苗字の1文字目:buf_name1$
9450 buf_name1$ = Mid$(buf_male_female_name1$,1,1)
9460 '2-2:苗字の2文字目:buf_name2$
9470 buf_name2$ = Mid$(buf_male_female_name1$,2,1)
9480 A=char_count(buf_name1$)
9490 B=char_count(buf_name2$)
9500 'B=char_count(buf_name2$)
9510 case 3:
9520 '3.苗字の画数が3つの時
9530 '3-1:苗字の1文字目:buf_name1$
9540 buf_name1$=Mid$(buf_male_female_name1$,1,1)
9550 '3-2:苗字が3つのときの2つ目の文字をもとめる
9560 '3-2:苗字の2つ目:buf_name2$
9570 buf_name2$=Mid$(buf_male_female_name1$,2,1)
9580 '3-3:苗字が3つのときの3文字目
9590 '3-3:苗字の3文字目buf_name3$(name1$,3,1)
9600 buf_name3$ = Mid$(buf_male_female_name1$,3,1)
9610 if buf_name2$="々" then
9620 A = char_count(buf_name1$) * 2
9630 B = char_count(buf_name3$)
9640 else
9650 A = char_count(buf_name1$) + char_count(buf_name2$)
9660 B = char_count(buf_name3$)
9670 endif
9680 '姓が4文字
9690 case 4:
9700 buf_name1$=Mid$(buf_male_female_name1$,1,1)
9710 buf_name2$=Mid$(buf_male_female_name1$,2,1)
9720 buf_name3$=Mid$(buf_male_female_name1$,3,1)
9730 buf_name4$=Mid$(buf_male_female_name1$,4,1)
9740 A=char_count(buf_name1$)+char_count(buf_name2$)+char_count(buf_name3$)
9750 B=char_count(buf_name4$)
9760 case else:
9770 end select
9780 '2.C,Dを求める
9790 select case buffer_name2_count
9800 case 1:
9810 '名が1文字の時
9820 'CとDを求める
9830 buff_name1$ = Mid$(buf_male_female_name2$,1,1)
9840 C = char_count(buff_name1$)
9850 'D=1:霊数
9860 D = 1
9870 case 2:
9880 '名が2文字の時
9890 'CとDを求める
9900 '名の1文字目:buff_name1$
9910 buff_name1$ = Mid$(buf_male_female_name2$,1,1)
9920 '名の2文字目:buff_name2$
9930 buff_name2$ = Mid$(buf_male_female_name2$,2,1)
9940 C = char_count(buff_name1$)
9950 D = char_count(buff_name2$)
9960 case 3:
9970 '名が3文字の時
9980 'CとDを求める
9990 '名の1文字目:buff_name1$
10000 buff_name1$ = Mid$(buf_male_female_name2$,1,1)
10010 '名の2文字目:buff_name2$
10020 buff_name2$ = Mid$(buf_male_female_name2$,2,1)
10030 if buff_name2$ = "々" then
10040 buff_name2$ = buff_name1$
10050 endif
10060 '名の3文字目:buff_name3$
10070 buff_name3$ = Mid$(buf_male_female_name2$,3,1)
10080 C = char_count(buff_name1$)
10090 D = char_count(buff_name2$) + char_count(buff_name3$)
10100 end select
10110 '1.先祖運を求める
10120 buffer_Senzo = A + B
10130 '2.性格運を求める
10140 buffer_Seikaku = B + C
10150 '3.愛情運を求める
10160 buffer_Aijyou = C + D
10170 '4.行動運を求める
10180 buffer_Kouzou = A + D
10190 'if buffer_Kouzou=10 then
10200 'endif
10210 '1.生数を求める
10220 func buf_Seisu(buffer)
10230 if buffer < 10 then
10240 seisu=buffer
10250 endif
10260 if buffer = 10 or buffer = 0 or buffer=20 or buffer=30 then
10270 seisu = 0
10280 endif
10290 if buffer > 10 then
10300 if buffer=20 then
10310 seisu = 0
10320 else
10330 n = buffer - (fix(buffer / 10) * 10)
10340 seisu = n
10350 endif
10360 endif
10370 endfunc seisu
10380 '和数を求める
10390 func buf_Wasu(buffer)
10400 buf_wasu = 0:wasu = 0
10410 if buffer < 10 then
10420 '
10430 wasu = buffer:goto wasu:
10440 else
10450 if buffer = 10 then
10460 wasu = 1:goto wasu:
10470 else
10480 if buffer > 10  then
10490 if buffer=19 or buffer=28 or buffer=37 then
10500 wasu=1:goto wasu:
10510 else
10520 if buffer = 29 then
10530 wasu=2:goto wasu:
10540 'endif
10550 else
10560 a = fix(buffer / 10)
10570 b = buffer - a * 10
10580 c = a + b
10590 if c = 19 or c=28 then
10600 wasu=1
10610 '
10620 else
10630 wasu=c
10640 endif
10650 endif
10660 endif
10670 endif
10680 endif
10690 if c < 10 then
10700 wasu = c
10710 'endif
10720 endif
10730 else
10740 if buffer=19 or buffer=28 then
10750 wasu = 1
10760 endif
10770 endif
10780 wasu:
10790 buf_wasu=wasu
10800 endfunc buf_wasu
10810 func buf_kyoudai$(buf_sex_type,buf_Sa$)
10820 select case buf_sex_type
10830 '1.女性の場合
10840 case 1:
10850 if (buf_Sa$ = "連続") then
10860 buffer_kyoudai$="長女相"
10870 endif
10880 if (buf_Sa$ = "1差") then
10890 buffer_kyoudai$="次女相"
10900 endif
10910 if (buf_Sa$ = "2差") then
10920 buffer_kyoudai$="三女相"
10930 endif
10940 if (buf_Sa$ = "3差") then
10950 buffer_kyoudai$="四女相"
10960 endif
10970 if (buf_Sa$ = "4差") then
10980 buffer_kyoudai$="五女相"
10990 endif
11000 '男性の場合
11010 case 2:
11020 if (buf_Sa$ = "連続") then
11030 buffer_kyoudai$="長男相"
11040 endif
11050 if (buf_Sa$ = "1差") then
11060 buffer_kyoudai$="次男相"
11070 endif
11080 if (buf_Sa$ = "2差") then
11090 buffer_kyoudai$="三男相"
11100 endif
11110 if (buf_Sa$ = "3差") then
11120 buffer_kyoudai$="四男相"
11130 endif
11140 if (buf_Sa$ = "4差") then
11150 buffer_kyoudai$="五男相"
11160 endif
11170 case else:
11180 end select
11190 kyoudai$=buffer_kyoudai$
11200 endfunc kyoudai$
11210 '1.タテ型
11220 '1.同じ数字が2組ある場合
11230 func Tate_gata$()
11240 if Senzo_wasu = Seikaku_wasu  then
11250 if Aijyou_wasu - Seikaku_wasu > 1 then
11260 Spirit_type$="タテ型"
11270 Sa_count = Aijyou_wasu - Seikaku_wasu - 1
11280 Sa$ = str$(Sa_count) + "差"
11290 else
11300 Spirit_type$="タテ型"
11310 Sa$="連続"
11320 endif
11330 endif
11340 endfunc
11350 '2. ナナメ型
11360 '同じ数字が2組ある場合
11370 func Naname_gata$()
11380 if  Senzo_wasu = Koudou_wasu And  Seikaku_wasu = Aijyou_wasu then
11390 Spirit_type$="斜め型"
11400 endif
11410 if Seikaku_wasu - Senzo_wasu > 1 then
11420 Sa_count = Seikaku_wasu  -  Senzo_wasu  -  1
11430 Sa$=str$(Sa_count)+" 差"
11440 else
11450 Sa$="連続"
11460 endif
11470 endfunc
11480 '3.表十字型
11490 '同じ数字が2組ある場合
11500 func Omote_jyuji_gata1$()
11510 if Senzo_wasu = Aijyou_wasu  And  Kouzou_wasu = Seikaku_wasu then
11520 Spirit_type$ = "表十字型"
11530 endif
11540 if Senzo _wasu - Seikaku_wasu > 1 then
11550 Sa_count = Senzo_wasu - Seikaku_wasu - 1
11560 else
11570 if Senzo_wasu  -  Seikaku_wasu = 1  then
11580 Sa$="連続"
11590 endif
11600 endif
11610 endfunc
11620 Spirit_type$="No data"
11630 '1.先祖運　和数
11640 Senzo_wasu = buf_Wasu(buffer_Senzo)
11650 '2.先祖運 生数
11660 Senzo_seisu = buf_Seisu(buffer_Senzo)
11670 '3.性格運 和数
11680 Seikaku_wasu = buf_Wasu(buffer_Seikaku)
11690 '4.性格運 生数
11700 Seikaku_seisu = buf_Seisu(buffer_Seikaku)
11710 '5.愛情運 和数
11720 Aijyou_wasu = buf_Wasu(buffer_Aijyou)
11730 '6.愛情運 生数
11740 Aijyou_seisu = buf_Seisu(buffer_Aijyou)
11750 '7.行動運 和数
11760 Koudou_wasu = buf_Wasu(buffer_Kouzou)
11770 '8.行動運 生数
11780 Koudou_seisu = buf_Seisu(buffer_Kouzou)
11790 '計算領域 ここまで
11800 '描画領域　ここから
11810 Result_ReiIden1:
11820 cls 3
11830 'Title
11840 'line (0,0)-(850,60),rgb(0,0,255),bf
11850 'pen 3:line (0,0)-(850,57),rgb(255,255,255),b
11860 'name
11870 'line (0,60)-(850,165),rgb(0,255,0),bf
11880 'pen 5:line (0,63)-(850,162),rgb(255,0,255),b
11890 '生数、和数
11900 'line (0,165)-(850,550),rgb(125,255,212),bf
11910 'pen 3:line(0,168)-(850,547),rgb(0,0,255),b
11920 'プッシュメッセージ
11930 'line (0,550)-(850,750),rgb(0,255,0),bf
11940 'pen 5:line (0,553)-(850,753),rgb(0,0,0),b
11950 '描画領域　ここまで
11960 'color rgb(255,255,255)
11970 'print "霊遺伝姓名学　診断結果１/2"+chr$(13)
11980 gload "config/Picture/Result_Screen1.png"
11990 print chr$(13)
12000 color rgb(0,0,0)
12010 print "名前:";buf_male_female_name1$;" ";buf_male_female_name2$;chr$(13)
12020 color rgb(255,0,255)
12030 print "1.先祖運";" ";"和数:";Senzo_wasu;"生数:";Senzo_seisu;chr$(13)
12040 print "2.性格運";" ";"和数:";Seikaku_wasu;"生数:";Seikaku_seisu;" ";chr$(13)
12050 print "3.愛情運";" ";"和数:";Aijyou_wasu;"生数:";Aijyou_seisu;chr$(13)
12060 print "4.行動運";" ";"和数:";Koudou_wasu;"生数:";Koudou_seisu;chr$(13)
12070 talk "診断結果１です、あなたのわすうとせいすうです。"
12080 color rgb(0,0,0)
12090 print"エンターキー:次へ行く"+chr$(13)
12100 print"スペースキー:トップ画面"+chr$(13)
12110 key$ = Input$(1)
12120 if key$ = chr$(13) then
12130 talk"":goto Jyuni_KisoUnn:
12140 else
12150 if key$=" " then
12160 talk"":goto Main_Screen:
12170 else
12180 talk"":goto Result_ReiIden1:
12190 endif
12200 endif
12210 '姓名判断データー文字比較
12220 '画数を求める関数
12230 func char_count(buf_count$)
12240 count=0:buffer=0
12250 '1画の文字 23文字
12260 for j=0 to ((Moji_1)-1)
12270 if buf_count$=buf_char_hiragana1$(j) then
12280 count =1:
12290 endif
12300 next j
12310 '2画の文字
12320 for j=0 to ((Moji_2)-1)
12330 if buf_count$=buf_char_hiragana2$(j)  then
12340 count = 2:
12350 endif
12360 next j
12370 for j=0 to ((Moji_3)-1)
12380 if buf_count$=buf_char_hiragana3$(j) then
12390 count =3:
12400 endif
12410 next j
12420 for j=0 to ((Moji_4)-1)
12430 if buf_count$=buf_char_hiragana4$(j) then
12440 count = 4:
12450 endif
12460 next j
12470 for j=0 to ((Moji_5)-1)
12480 if buf_count$=buf_char_hiragana5$(j) then
12490 count = 5:
12500 endif
12510 next j
12520 for j=0 to ((Moji_6)-1)
12530 if buf_count$=buf_char_hiragana6$(j) then
12540 count= 6
12550 endif
12560 next j
12570 for  j=0 to ((Moji_7)-1)
12580 if buf_count$=buf_char_hiragana7$(j) then
12590 count=  7
12600 endif
12610 next j
12620 for j=0 to ((Moji_8)-1)
12630 if buf_count$=buf_char_hiragana8$(j) then
12640 count= 8
12650 endif
12660 next j
12670 for j=0 to ((Moji_9)-1)
12680 if buf_count$=buf_char_hiragana9$(j) then
12690 count=9
12700 endif
12710 next j
12720 for j=0 to ((Moji_10)-1)
12730 if buf_count$=buf_char_hiragana10$(j) then
12740 count=10
12750 endif
12760 next j
12770 for j=0 to ((Moji_11)-1)
12780 if buf_count$=buf_char_hiragana11$(j) then
12790 count=11
12800 endif
12810 next j
12820 for j=0 to  ((Moji_12)-1)
12830 if buf_count$=buf_char_hiragana12$(j) then
12840 count=12
12850 endif
12860 next j
12870 for j=0 to ((Moji_13)-1)
12880 if buf_count$=buf_char_hiragana13$(j) then
12890 count=13
12900 endif
12910 next j
12920 for j=0 to ((Moji_14)-1)
12930 if buf_count$=buf_char_hiragana14$(j) then
12940 count=14
12950 endif
12960 next j
12970 for j=0 to ((Moji_15)-1)
12980 if buf_count$=buf_char_hiragana15$(j) then
12990 count=15
13000 endif
13010 next j
13020 for j=0 to ((Moji_16)-1)
13030 if buf_count$=buf_char_hiragana16$(j) then
13040 count=16
13050 endif
13060 next j
13070 for j=0 to ((Moji_17)-1)
13080 if buf_count$=buf_char_hiragana17$(j) then
13090 count=17
13100 endif
13110 next j
13120 for j=0 to ((Moji_18)-1)
13130 if buf_count$=buf_char_hiragana18$(j) then
13140 count=18
13150 endif
13160 next j
13170 for j=0 to ((Moji_19)-1)
13180 if buf_count$=buf_char_hiragana19$(j) then
13190 count=19
13200 endif
13210 next j
13220 for j=0 to ((Moji_20)-1)
13230 if buf_count$=buf_char_hiragana20$(j) then
13240 count=20
13250 endif
13260 next i
13270 for j=0 to ((Moji_21)-1)
13280 if buf_count$=buf_char_hiragana21$(j) then
13290 count=21
13300 endif
13310 next j
13320 for j=0 to ((Moji_22)-1)
13330 if buf_count$=buf_char_hiragana22$(j) then
13340 count=22
13350 endif
13360 next j
13370 for j=0 to ((Moji_23)-1)
13380 if buf_count$=buf_char_hiragana23$(j) then
13390 count=23
13400 endif
13410 next j
13420 for j=0 to ((Moji_24)-1)
13430 if buf_count$=buf_char_hiragana24$(j) then
13440 count=24
13450 endif
13460 buffer = count
13470 next j
13480 endfunc buffer
13490 '3.ヘルプ
13500 help:
13510 cls 3:font 48:color rgb(0,0,0),,rgb(176,196,222)
13520 '描画領域 ここから
13530 'line (0,0)-(550,60),rgb(0,0,255),bf
13540 'pen 5:line(0,0)-(547,57),rgb(127,255,212),b
13550 'line (0,60)-(550,470),rgb(127,255,212),bf
13560 'pen 5:line(0,57)-(547,467),rgb(0,0,255),b
13570 'line (0,470)-(550,550),rgb(0,255,0),bf
13580 'pen 5:line(0,467)-(547,547),rgb(0,0,255),b
13590 '描画領域　ここまで
13600 talk "へるぷがめんです。番号を選んでエンターキーを押してください。"
13610 'color rgb(255,255,255):print "姓名判断　ヘルプ"+chr$(13)
13620 gload "config/Picture/Help2.png"
13630 sp_on 1,1:sp_put 1,(1,115),0,0
13640 No=0
13650 print chr$(13)
13660 color rgb(255,0,255):print" 1.バージョン情報"+chr$(13)
13670 color rgb(255,0,255):print" 2.参考文献"+chr$(13)
13680 color rgb(255,0,255):print" 3.前の画面に戻る"+chr$(13)
13690 color rgb(255,0,255):PRINT" 4.プログラムの終了"+chr$(13)
13700 'olor rgb(0,0,0):Input"番号:",selectNo
13710 key4$:
13720 key$=input$(1)
13730 if key$=chr$(31) then
13740 select case No
13750 case 0:
13760       No=1:sp_on 1,0:sp_on 2,1:sp_put 2,(1,190),0,0:goto key4$:
13770 case 1:
13780       No=2:sp_on 2,0:sp_on 3,1:sp_put 3,(1,295),0,0:goto key4$:
13790 case 2:
13800       No=3:sp_on 3,0:sp_on 4,1:sp_put 4,(1,390),0,0:goto key4$:
13810 case 3
13820       No=0:sp_on 1,1:sp_on 4,0:sp_put 1,(1,115),0,0:goto key4$:
13830 end select
13840 else
13850 if key$=chr$(13) then
13860 select case No
13870 case 0:
13880       sp_on 1,0:goto Version_Info:
13890 case 1:
13900       sp_on 2,0:goto Reference_Book
13910 case 2:
13920       sp_on 3,0:goto Main_Screen:
13930 case 3:
13940       sp_on 4,0:talk"終了します":cls 3:cls 4:end
13950 end select
13960 else
13970 goto key4$:
13980 endif
13990 endif
14000 'if selectNo=1 then goto Version_Info:
14010 'if selectNo=2 then goto Reference_Book:
14020 'プログラムの終了
14030 'if selectNo=4 then talk"終了いたします":cls 3:end
14040 if selectNo=3 then goto Main_Screen:
14050 '十二基礎運を求める
14060 Jyuni_KisoUnn:
14070 buffer_Kiso(0)=Senzo_wasu
14080 buffer_Kiso(1)=Seikaku_wasu
14090 buffer_Kiso(2)=Aijyou_wasu
14100 buffer_Kiso(3)=Koudou_wasu
14110 'シャッフル前の処理 ここから
14120 ' 5.オール同数型:○ ok
14130 if (buffer_Kiso(0) = buffer_Kiso(1) and  buffer_Kiso(2) = buffer_Kiso(3) and  buffer_Kiso(1)=buffer_Kiso(2)) then
14140 Kisoun$ = "オール同数型":goto shuffle:
14150 else
14160 '　1.タテ型:○ ok
14170 if (((buffer_Kiso(1) - buffer_Kiso(0)) = 0) and (buffer_Kiso(3) - buffer_Kiso(2)) = 0) and (buffer_Kiso(3) <> buffer_Kiso(1)) then
14180 Kisoun$="タテ型":goto shuffle:
14190 else
14200 '2.ヨコ型:○ ok
14210 if (buffer_Kiso(1)=buffer_Kiso(3) and abs(buffer_Kiso(0) - buffer_Kiso(2)) > 1) then
14220 Kisoun$="ヨコ型":goto shuffle:
14230 else
14240 '3.斜め型:○ ok
14250 if ((buffer_Kiso(0)=buffer_Kiso(3)) and (buffer_Kiso(1) = buffer_Kiso(2)) and (buffer_Kiso(0) <> buffer_Kiso(1))) then
14260 Kisoun$="斜め型":goto shuffle:
14270 else
14280 '4.上下型:○ ok
14290 if (buffer_Kiso(0) = buffer_Kiso(2) and buffer_Kiso(1) - buffer_Kiso(0)>1 and buffer_Kiso(1) - buffer_Kiso(2)>1 and buffer_Kiso(1)-buffer_Kiso(3) > 1) then
14300 Kisoun$="上下型":goto shuffle:
14310 else
14320 '5.オール同数型
14330 'if (buffer_Kiso(0) = buffer_Kiso(1) = buffer_Kiso(2) = buffer_Kiso(3)) then
14340 'Kisoun$="オール同数型":goto shuffle:
14350 'else
14360 '6.表十字型
14370 '6.表十字型 同じ数字が2組ある
14380 if ((buffer_Kiso(0) = buffer_Kiso(2)) and (abs(buffer_Kiso(3) - buffer_Kiso(1))=1))  then
14390 Kisoun$="表十字型":goto shuffle:
14400 else
14410 '6-2.表十字型 (ヨコ系)
14420 if ((buffer_Kiso(1) - buffer_Kiso(3) = 0) and (buffer_Kiso(2) - buffer_Kiso(0) = 1)) then
14430 Kisoun$="表十字型(ヨコ系)":goto shuffle:
14440 else
14450 '6-3.表十字型 (上下系):○ ok
14460 if ((buffer_Kiso(2)-buffer_Kiso(0)=0) and (buffer_Kiso(1)-buffer_Kiso(3)=1)) then
14470 Kisoun$="表十字型(上下系)":goto shuffle:
14480 else
14490 '7-1.順序型(タテ・上下系):○ ok
14500 if ((abs(buffer_Kiso(1)-buffer_Kiso(2))=1) and (abs(buffer_Kiso(3) - buffer_Kiso(0)) = 1) and (abs(buffer_Kiso(2)-buffer_Kiso(1))=1)) then
14510 Kisoun$="順序型(タテ ・上下系)":goto shuffle:
14520 else
14530 '7-2.順序型(タテ・ヨコ系):○ ok
14540 if ((abs(buffer_Kiso(3) - buffer_Kiso(2)) = 1) and abs(buffer_Kiso(1) - buffer_Kiso(3)=1) and ((buffer_Kiso(0)=1 and buffer_Kiso(1)=9) or abs(buffer_Kiso(0) - buffer_Kiso(1)) = 1)) then
14550 Kisoun$="順序型(タテ・ヨコ系)":goto shuffle:
14560 else
14570 '7-3.順序型(斜め・上下系):○ ok
14580 if ((buffer_Kiso(3)-buffer_Kiso(0)=1) and (buffer_Kiso(0)-buffer_Kiso(2)=1) and (buffer_Kiso(2)-buffer_Kiso(1)=1)) then
14590 Kisoun$="順序型(斜め・上下系)":goto shuffle
14600 else
14610 '7-4.順序型(斜め・ヨコ系):○ ok
14620 if ((abs(buffer_Kiso(0) - buffer_Kiso(3)) = 2) and (abs(buffer_Kiso(3) - buffer_Kiso(1)) = 2) and (abs(buffer_Kiso(1) - buffer_Kiso(2)) = 7)) then
14630 Kisoun$="順序型(斜め・ヨコ系)":goto shuffle
14640 else
14650 '8-1.隔離型(タテ・上下系):○ ok
14660 if ((abs(buffer_Kiso(1)-buffer_Kiso(0)) = 2) and (abs(buffer_Kiso(2)-buffer_Kiso(3)) = 2) and (buffer_Kiso(3)-buffer_Kiso(1) > 2)) then
14670 Kisoun$="隔離型(タテ・上下系)":goto shuffle:
14680 '8-2.隔離型(タテ・ヨコ系)
14690 else
14700 if ((buffer_Kiso(1) - buffer_Kiso(0) = 2) and (abs(buffer_Kiso(3) - buffer_Kiso(1)) = 2) and (abs(buffer_Kiso(3) - buffer_Kiso(2)) = 2)) then
14710 Kisoun$="隔離型(タテ・ヨコ系)":goto shuffle:
14720 else
14730 '8-3.隔離型(斜め・上下系)○:ok
14740 if (((abs(buffer_Kiso(3)-buffer_Kiso(0)=2) and ((abs(buffer_Kiso(2)-buffer_Kiso(1))=2) and (abs(buffer_Kiso(2) - buffer_Kiso(0)) = 7))))) then
14750 Kisoun$="隔離型(斜め・上下系)":goto shuffle:
14760 else
14770 '8-4.隔離型(斜め・ヨコ系)
14780 if ((buffer_Kiso(0)-buffer_Kiso(3)=2) and (buffer_Kiso(3)-buffer_Kiso(1)=2) and (buffer_Kiso(2)-buffer_Kiso(1)=2)) then
14790 Kisoun$="隔離型(斜め・ヨコ系)":goto shuffle:
14800 else
14810 '8-5.隔離型(タテ系):○ ok
14820 if ((buffer_Kiso(2) - buffer_Kiso(0) = 3) and (buffer_Kiso(0)-buffer_Kiso(1) = 2) and (buffer_Kiso(1)-buffer_Kiso(3) = 2)) then
14830 Kisoun$="隔離型(タテ系)":goto shuffle:
14840 else
14850 '8-6.隔離型(斜め系)
14860 if (abs(buffer_Kiso(3)-buffer_Kiso(0)-1)=1 and (buffer_Kiso(2) - buffer_Kiso(1)-1)=1 and (abs(buffer_Kiso(1)-buffer_Kiso(3)-1)=2)) then
14870 Kisoun$="隔離型(斜め系)":goto shuffle:
14880 '8-7.隔離型(上下・ヨコ系)
14890 else
14900 if ((buffer_Kiso(3)-buffer_Kiso(0)=2) and (buffer_Kiso(1)-buffer_Kiso(3)=2) and (buffer_Kiso(2)-buffer_Kiso(1)=3)) then
14910 Kisoun$="隔離型(上下・ヨコ系)":goto shuffle:
14920 else
14930 '9-1.中一差型 (タテ系)
14940 if ((buffer_Kiso(0) - buffer_Kiso(1) = 1) and (buffer_Kiso(3) - buffer_Kiso(2) = 1) and (buffer_Kiso(1) - buffer_Kiso(3) = 2)) then
14950 Kisoun$="中一差(タテ系)":goto shuffle:
14960 else
14970 '9-2.中一差(斜め系)
14980 if ((buffer_Kiso(3)-buffer_Kiso(0)=1) and (buffer_Kiso(2)-buffer_Kiso(1)=1) and (buffer_Kiso(0)-buffer_Kiso(2)=2)) then
14990 Kisoun$="中一差(斜め系)":goto shuffle:
15000 else
15010 '10-1.中二差(タテ系)
15020 if ((buffer_Kiso(0)-buffer_Kiso(1)=1) and (buffer_Kiso(3)-buffer_Kiso(2)=1) and buffer_Kiso(1)-buffer_Kiso(3)=3)  then
15030 Kisoun$="中二差(タテ系)":goto shuffle:
15040 else
15050 '10-2.中二差(斜め系)
15060 if ((buffer_Kiso(0)-buffer_Kiso(3)=1) and (buffer_Kiso(1)-buffer_Kiso(2)=1))  then
15070  Kisoun$="中二差(斜め系)":goto shuffle:
15080 else
15090 '11-1.中広型(タテ系)
15100 if ((buffer_Kiso(0)-buffer_Kiso(1)=1) and (buffer_Kiso(2)-buffer_Kiso(3)=1) and (buffer_Kiso(3)-buffer_Kiso(1)=4)) then
15110 Kisoun$="中広型(タテ系)":goto shuffle:
15120 else
15130 '12-1.中順序型(ヨコ系)
15140 if ((buffer_Kiso(1) - buffer_Kiso(3) = 1) and (buffer_Kiso(0) - buffer_Kiso(1) = 2) and (buffer_Kiso(3) - buffer_Kiso(2) = 2))  then
15150 Kisoun$="中順序型(ヨコ系)":goto shuffle:
15160 else
15170 '12-2.中順序型(上下系)
15180 if ((buffer_Kiso(2)-buffer_Kiso(0)=1) and (buffer_Kiso(1) - buffer_Kiso(3))=2) then
15190 Kisoun$="中順序型(上下系)":goto shuffle:
15200 endif
15210 endif
15220 endif
15230 endif
15240 endif
15250 endif
15260 endif
15270 endif
15280 endif
15290 endif
15300 endif
15310 endif
15320 endif
15330 endif
15340 endif
15350 endif
15360 endif
15370 endif
15380 endif
15390 endif
15400 endif
15410 endif
15420 endif
15430 endif
15440 endif
15450 endif
15460 'endif
15470 'endif
15480 'シャッフル前の処理 ここまで
15490 shuffle:
15500 timer=0
15510 for i=0 to 3
15520 for j=3 to i+1 step -1
15530 if buffer_Kiso(j-1)>buffer_Kiso(j) then
15540 swap buffer_Kiso(j),buffer_Kiso(j-1)
15550 endif
15560 next j
15570 next i
15580 cls 3:talk"あなたのじゅうにきそうんです"
15590 'rgb(0,0,255):blue
15600 'line (0,0)-(1200,60),rgb(0,0,255),bf
15610 'pen 3:line(0,3)-(1203,63),rgb(0,0,255),b
15620 'line (0,60)-(1200,165),rgb(0,255,0),bf
15630 'pen 3:line (0,63)-(1203,168),rgb(0,0,255),b
15640 'line (0,165)-(1200,165+(550/3)),rgb(125,255,212),bf
15650 'pen 3:line (0,168)-(1203,165+(550/3)),rgb(0,0,255),b
15660 'line (0,165+(550/3))-(1200,165+(550/3)+90),rgb(0,255,0),bf
15670 'en 3:line (0,165+(550/3))-(1203,165+(550/3)+90+3),rgb(0,0,0),b
15680 gload "config/Picture/Result_Screen2.png"
15690 'color rgb(255,255,255)
15700 'print"十二基礎運 診断結果 2/2"+chr$(13)
15710 print chr$(13)
15720 'for j=0 to 3
15730 'print buffer_Kiso(j);
15740 'next j
15750 'print timer;"msec"
15760 'print chr$(13)
15770 buf_kyodai$=get_Sa$()
15780 color rgb(0,0,0)
15790 print "名前:";buf_male_female_name1$;" ";buf_male_female_name2$;chr$(13)
15800 color rgb(255,0,255)
15810 print"和数:";Kisoun$;chr$(13)
15820 print"兄弟相:";buf_kyodai$;chr$(13)
15830 color rgb(0,0,0)
15840 print"エンターキー:戻る" + chr$(13)
15850 key$ = input$(1)
15860 if key$ = chr$(13) then
15870 goto Result_ReiIden1:
15880 else
15890 goto shuffle:
15900 endif
15910 'バージョン情報
15920 Version_Info:
15930 cls 3:font 24
15940 line(0,0) - (1300,40),rgb(0,0,255),bf
15950 line (0,40)-(1300,220),rgb(127,255,212),bf
15960 line (0,220)-(1300,280),rgb(0,255,0),bf
15970 talk "バージョン情報です"
15980 color rgb(255,255,255)
15990 print "バージョン情報" + chr$(13)
16000 color rgb(255,0,255)
16010 print "アプリ名:霊遺伝姓名学 スタンダード" + chr$(13)
16020 print "Author:licksjp" + chr$(13)
16030 print Version$ + chr$(13)
16040 print"(c)copy rights licksjp All rights reserved since 2019" + chr$(13)
16050 color rgb(0,0,0)
16060 print"エンターキーを押してください" + chr$(13)
16070 a$ = input$(1)
16080 if a$=chr$(13) then goto Main_Screen:
16090 Reference_Book:
16100 cls 3
16110 line(0,0)-(1200,60),rgb(0,0,255),bf
16120 pen 3:line(0,0)-(1201,61),rgb(0,0,255),b
16130 line(0,60)-(1200,580),rgb(127,255,212),bf
16140 pen 3:line(0,61)-(1201,581),rgb(0,0,255),b
16150 line(0,580)-(1200,640),rgb(0,255,0),bf
16160 pen 3:line(0,583)-(1203,640),rgb(0,0,255),b
16170 color rgb(255,255,255)
16180 print "参考文献" + chr$(13)
16190 color rgb(255,0,255)
16200 print "書名:姓名の暗号" + chr$(13)
16210 print "著者:樹門 幸宰" + chr$(13)
16220 print "出版社:幻冬舎" + chr$(13)
16230 print "定価:1400+税"+chr$(13)
16240 print "ISBN:4-344-0077-8" + chr$(13)
16250 color rgb(0,0,0)
16260 print "スペースキーを押してください"+CHR$(13)
16270 key$ = input$(1)
16280 if key$=" " then goto Reference_Book2:
16290 '
16300 Reference_Book2:
16310 cls 3
16320 pen 3:line(0,3) - (1203,63),rgb(0,0,255),b
16330 line(0,0) - (1200,60),rgb(0,0,255),bf
16340 pen 3:line(0,57) - (1197,577),rgb(0,0,255),b
16350 line(0,60) - (1200,570),rgb(127,255,212),bf
16360 pen 3:line(0,63) - (1197,753),rgb(0,0,255),b
16370 line(0,573) - (1193,750),rgb(0,255,0),bf
16380 color rgb(255,255,255)
16390 print "参考文献2" + chr$(13)
16400 color rgb(255,0,255)
16410 print "書名:姓名の暗号 解読法" + chr$(13)
16420 print "著者:樹門 幸宰" + chr$(13)
16430 print "出版社:幻冬舎" + chr$(13)
16440 print "定価:600円 + 税" + chr$(13)
16450 print "ISBN:978-4-344-41190-6" + chr$(13)
16460 color rgb(0,0,0)
16470 print"スペースキー:参考文献1へ行く" + chr$(13)
16480 print"エンターキー:トップ画面" + chr$(13)
16490 key$=input$(1)
16500 if key$=" " then goto Reference_Book:
16510 if key$=chr$(13) then goto Main_Screen:
16520 '差を求める
16530 func get_Sa$()
16540 for i=0 to 3
16550 for j=3 to i+1 step -1
16560 if buffer_Kiso(j-1)>buffer_Kiso(j) then
16570 swap buffer_Kiso(j),buffer_Kiso(j-1)
16580 endif
16590 next j
16600 next i
16610 sa1=0:sa2=0:sa3=0:sa4=0:sa_max=0:sa_max1=0:sa_max2=0:
16620 sa1=abs(buffer_Kiso(2)-buffer_Kiso(1))  - 1
16630 sa2=abs(buffer_Kiso(2)-buffer_Kiso(3)) - 1
16640 sa3=abs(buffer_Kiso(1)-buffer_Kiso(0)) - 1
16650 sa4=abs(buffer_Kiso(3)-buffer_Kiso(0)) - 1
16660 sa_max1=max(sa1,sa2)
16670 sa_max2=max(sa2,sa3)
16680 sa_max3=max(sa3,sa1)
16690 if (sa1=sa2 and sa3=sa4) then
16700 sa_max = -1
16710 else
16720 if (buffer_Kiso(3)=9 and buffer_Kiso(0)=1) and (buffer_Kiso(3)-buffer_Kiso(2)-1=0) and (buffer_Kiso(2)-buffer_Kiso(1)-1=0) then
16730 sa_max=0
16740 else
16750 'Patern1 sa_max1が一番大きいとき
16760 if (sa_max1 >= sa_max2 and sa_max1 >= sa_max3) then
16770 sa_max=sa_max1
16780 else
16790 'Patern2 sa_maxが一番大きいとき
16800 if (sa_max2 >= sa_max1 and sa_max2 >= sa_max3) then
16810 sa_max=sa_max2
16820 else
16830 'Patern3 sa_max3が一番大きいとき
16840 if (sa_max3 >= sa_max1 and sa_max3>=sa_max2) then
16850 sa_max=sa_max3
16860 endif
16870 endif
16880 endif
16890 endif
16900 endif
16910 select case sa_max
16920 case -1:
16930        buffer$ = "オール同数型"
16940        select case sex_type
16950        case 1:
16960              buffer2$="四女相"
16970        case 2:
16980              buffer2$="四男相"
16990        end select
17000 case 0:
17010        buffer$ ="連続"
17020        select case sex_type
17030        case 1:
17040              buffer2$="長女相"
17050        case 2:
17060              buffer2$="長男相"
17070        end select
17080 case 1:
17090        buffer$ ="1差"
17100        select case sex_type
17110        case 1:
17120             buffer2$="次女相"
17130        case 2:
17140             buffer2$="次男相"
17150        end select
17160 case 2:
17170        buffer$ ="2差"
17180        select case sex_type
17190        case 1:
17200             buffer2$="3女相"
17210        case 2:
17220             buffer2$="3男相"
17230        end select
17240 case 3:
17250        buffer$ ="3差"
17260        select case sex_type
17270        case 1:
17280              buffer2$="4女相"
17290        case 2:
17300              buffer2$="4男相"
17310        end select
17320 case 4:
17330        buffer$ ="4差"
17340        select case sex_type
17350         case 1:
17360              buffer2$="5女相"
17370         case 2:
17380              buffer2$="5男相"
17390        end select
17400 case else:
17410 end select
17420 buffer_Sa$ = buffer$ +","+ buffer2$
17430 endfunc buffer_Sa$
