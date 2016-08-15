structure multimapTheory :> multimapTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading multimapTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open lem_set_extraTheory missing_pervasivesTheory
  in end;
  val _ = Theory.link_parents
          ("multimap",
          Arbnum.fromString "1471276712",
          Arbnum.fromString "787889")
          [("missing_pervasives",
           Arbnum.fromString "1471276695",
           Arbnum.fromString "273504"),
           ("lem_set_extra",
           Arbnum.fromString "1471269279",
           Arbnum.fromString "653228")];
  val _ = Theory.incorporate_types "multimap" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("min", "bool"), ID("num", "num"),
   ID("list", "list"), ID("pair", "prod"),
   ID("lem_basic_classes", "Ord_class"), ID("option", "option"),
   ID("bool", "!"), ID("pair", ","), ID("bool", "/\\"),
   ID("prim_rec", "<"), ID("arithmetic", "<="), ID("min", "="),
   ID("lem_basic_classes", "ordering"), ID("min", "==>"),
   ID("arithmetic", ">"), ID("arithmetic", ">="), ID("list", "APPEND"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"), ID("string", "CHR"),
   ID("string", "char"), ID("bool", "COND"), ID("list", "CONS"),
   ID("lem_basic_classes", "EQ"), ID("bool", "F"), ID("pred_set", "GSPEC"),
   ID("bool", "IN"), ID("bool", "LET"), ID("list", "NIL"),
   ID("option", "NONE"), ID("arithmetic", "NUMERAL"),
   ID("lem_basic_classes", "Ord_class_compare_method"),
   ID("lem_basic_classes", "Ord_class_isGreater_method"),
   ID("lem_basic_classes", "Ord_class_isLess_method"),
   ID("lem_set", "SET_SPLIT"), ID("list", "SET_TO_LIST"),
   ID("option", "SOME"), ID("bool", "T"), ID("pair", "UNCURRY"),
   ID("relation", "WF"), ID("arithmetic", "ZERO"),
   ID("lem_set_extra", "chooseAndSplit"), ID("lem", "failwith"),
   ID("multimap", "findHighestKVWithKEquivTo"),
   ID("multimap", "findLowestKVWithKEquivTo"),
   ID("lem_basic_classes", "instance_Basic_classes_Ord_tup2_dict"),
   ID("multimap", "lookupBy0"), ID("option", "option_CASE"),
   ID("lem_basic_classes", "pairCompare"),
   ID("lem_basic_classes", "pairGreater"),
   ID("lem_basic_classes", "pairLess"), ID("pair", "pair_CASE"),
   ID("multimap", "testEquiv"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [2], TYOP [0, 1, 0], TYOP [0, 1, 2], TYV "'v", TYV "'k",
   TYOP [4, 5, 4], TYOP [3, 6], TYOP [0, 6, 0], TYOP [0, 8, 7],
   TYOP [0, 5, 9], TYOP [0, 5, 0], TYOP [0, 5, 11], TYOP [0, 12, 10],
   TYOP [5, 4], TYOP [0, 14, 13], TYOP [5, 5], TYOP [0, 16, 15],
   TYOP [6, 6], TYOP [0, 18, 18], TYOP [0, 8, 19], TYOP [0, 12, 20],
   TYOP [0, 5, 21], TYOP [0, 14, 22], TYOP [0, 16, 23], TYOP [0, 18, 0],
   TYOP [0, 8, 25], TYOP [0, 12, 26], TYOP [0, 5, 27], TYOP [0, 14, 28],
   TYOP [0, 16, 29], TYOP [4, 8, 18], TYOP [4, 12, 31], TYOP [4, 5, 32],
   TYOP [4, 14, 33], TYOP [4, 16, 34], TYOP [0, 35, 0], TYOP [0, 35, 36],
   TYOP [4, 6, 8], TYOP [4, 8, 38], TYOP [0, 11, 0], TYOP [0, 4, 0],
   TYOP [0, 41, 0], TYOP [0, 16, 0], TYOP [0, 43, 0], TYOP [0, 14, 0],
   TYOP [0, 45, 0], TYOP [0, 12, 0], TYOP [0, 47, 0], TYOP [0, 30, 0],
   TYOP [0, 49, 0], TYOP [0, 8, 0], TYOP [0, 51, 0], TYOP [0, 2, 0],
   TYOP [0, 25, 0], TYOP [0, 39, 0], TYOP [0, 55, 0], TYOP [0, 38, 0],
   TYOP [0, 57, 0], TYOP [0, 4, 6], TYOP [0, 5, 59], TYOP [0, 32, 33],
   TYOP [0, 5, 61], TYOP [0, 34, 35], TYOP [0, 16, 63], TYOP [0, 33, 34],
   TYOP [0, 14, 65], TYOP [0, 31, 32], TYOP [0, 12, 67], TYOP [0, 18, 31],
   TYOP [0, 8, 69], TYOP [0, 38, 39], TYOP [0, 8, 71], TYOP [4, 6, 0],
   TYOP [0, 0, 73], TYOP [0, 6, 74], TYOP [0, 8, 38], TYOP [0, 6, 76],
   TYOP [0, 0, 0], TYOP [0, 0, 78], TYOP [0, 7, 0], TYOP [0, 7, 80],
   TYOP [0, 18, 25], TYOP [6, 39], TYOP [0, 83, 0], TYOP [0, 83, 84],
   TYOP [13], TYOP [0, 86, 0], TYOP [0, 86, 87], TYOP [0, 6, 8],
   TYOP [0, 39, 55], TYOP [0, 38, 57], TYOP [0, 7, 7], TYOP [0, 7, 92],
   TYOP [0, 1, 1], TYOP [21], TYOP [0, 1, 95], TYOP [0, 0, 79],
   TYOP [0, 0, 93], TYOP [0, 18, 19], TYOP [0, 0, 99], TYOP [0, 6, 6],
   TYOP [0, 6, 101], TYOP [0, 0, 102], TYOP [3, 95], TYOP [0, 104, 104],
   TYOP [0, 95, 105], TYOP [0, 6, 73], TYOP [0, 107, 8], TYOP [0, 6, 51],
   TYOP [0, 6, 7], TYOP [0, 110, 110], TYOP [0, 6, 18], TYOP [0, 112, 112],
   TYOP [4, 8, 8], TYOP [0, 114, 7], TYOP [0, 115, 115], TYOP [0, 5, 86],
   TYOP [0, 5, 117], TYOP [0, 16, 118], TYOP [0, 4, 86], TYOP [0, 4, 120],
   TYOP [0, 14, 121], TYOP [0, 16, 12], TYOP [0, 8, 114], TYOP [0, 6, 124],
   TYOP [5, 6], TYOP [0, 126, 125], TYOP [0, 39, 83], TYOP [0, 4, 18],
   TYOP [0, 5, 129], TYOP [0, 130, 112], TYOP [0, 8, 9],
   TYOP [0, 132, 115], TYOP [0, 37, 0], TYOP [0, 8, 83],
   TYOP [0, 126, 135], TYOP [0, 104, 6], TYOP [0, 14, 126],
   TYOP [0, 16, 138], TYOP [0, 110, 7], TYOP [0, 7, 140],
   TYOP [0, 18, 141], TYOP [0, 101, 6], TYOP [0, 6, 143],
   TYOP [0, 18, 144], TYOP [0, 39, 18], TYOP [0, 146, 18],
   TYOP [0, 18, 147], TYOP [0, 83, 148], TYOP [0, 6, 86], TYOP [0, 6, 150],
   TYOP [0, 121, 151], TYOP [0, 118, 152], TYOP [0, 14, 89],
   TYOP [0, 16, 154], TYOP [0, 16, 89], TYOP [0, 14, 156],
   TYOP [0, 130, 18], TYOP [0, 6, 158], TYOP [0, 60, 6], TYOP [0, 6, 160],
   TYOP [0, 38, 18], TYOP [0, 8, 162], TYOP [0, 163, 18],
   TYOP [0, 39, 164], TYOP [0, 8, 18], TYOP [0, 6, 166], TYOP [0, 167, 18],
   TYOP [0, 38, 168]]
  end
  val _ = Theory.incorporate_consts "multimap" tyvector
     [("testEquiv", 3), ("lookupBy0", 17),
      ("findLowestKVWithKEquivTo", 24), ("findHighestKVWithKEquivTo", 24)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("P", 30), TMV("R", 37), TMV("bestK", 5), TMV("bestV", 4),
   TMV("chosenK", 5), TMV("chosenV", 4), TMV("currentBestK", 5),
   TMV("currentBestV", 4), TMV("dict_Basic_classes_Ord_k", 16),
   TMV("dict_Basic_classes_Ord_v", 14), TMV("equiv", 12),
   TMV("highEnough", 8), TMV("higher", 8), TMV("highestEquiv", 6),
   TMV("k", 5), TMV("lower", 8), TMV("lowerThanLow", 8),
   TMV("lowestEquiv", 6), TMV("m", 8), TMV("maybeBest", 18), TMV("s", 6),
   TMV("subSet", 8), TMV("tooHigh", 8), TMV("v", 16), TMV("v", 6),
   TMV("v", 39), TMV("v1", 14), TMV("v2", 5), TMV("v2", 38), TMV("v3", 12),
   TMV("v3", 6), TMV("v4", 8), TMV("v5", 18), TMV("wanted", 8),
   TMV("x", 1), TMV("y", 1), TMC(7, 40), TMC(7, 42), TMC(7, 44),
   TMC(7, 46), TMC(7, 48), TMC(7, 50), TMC(7, 52), TMC(7, 53), TMC(7, 54),
   TMC(7, 51), TMC(7, 56), TMC(7, 58), TMC(8, 60), TMC(8, 62), TMC(8, 64),
   TMC(8, 66), TMC(8, 68), TMC(8, 70), TMC(8, 72), TMC(8, 75), TMC(8, 77),
   TMC(9, 79), TMC(10, 3), TMC(11, 3), TMC(12, 79), TMC(12, 81),
   TMC(12, 82), TMC(12, 85), TMC(12, 88), TMC(12, 89), TMC(12, 90),
   TMC(12, 91), TMC(14, 79), TMC(15, 3), TMC(16, 3), TMC(17, 93),
   TMC(18, 94), TMC(19, 94), TMC(20, 96), TMC(22, 97), TMC(22, 98),
   TMC(22, 100), TMC(22, 103), TMC(23, 106), TMC(24, 86), TMC(25, 0),
   TMC(26, 108), TMC(27, 109), TMC(28, 111), TMC(28, 113), TMC(28, 116),
   TMC(29, 104), TMC(29, 7), TMC(30, 18), TMC(31, 94), TMC(32, 119),
   TMC(32, 122), TMC(33, 123), TMC(34, 123), TMC(35, 127), TMC(36, 9),
   TMC(37, 112), TMC(37, 128), TMC(38, 0), TMC(39, 131), TMC(39, 133),
   TMC(40, 134), TMC(41, 1), TMC(42, 136), TMC(43, 137), TMC(44, 24),
   TMC(45, 24), TMC(46, 139), TMC(47, 17), TMC(48, 142), TMC(48, 145),
   TMC(48, 149), TMC(49, 153), TMC(50, 155), TMC(51, 157), TMC(52, 159),
   TMC(52, 161), TMC(52, 165), TMC(52, 169), TMC(53, 3), TMC(54, 78)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op testEquiv_def x = x
    val op testEquiv_def =
    DT(((("multimap",4),[]),[]),
       [read"%43%34%43%35%60%120$1@$0@@%75%57%70$1@%90%72%72%103@@@@@%57%58$1@%90%72%73%103@@@@@%57%70$0@%90%72%72%103@@@@@%59$0@%90%72%73%103@@@@@@@@%99@%75%57%58$1@%90%72%72%103@@@@@%58$0@%90%72%72%103@@@@@@%99@%75%57%69$1@%90%72%73%103@@@@@%69$0@%90%72%73%103@@@@@@%99@%81@@@@|@|@"])
  fun op lookupBy0_def x = x
    val op lookupBy0_def =
    DT(((("multimap",9),[]),[]),
       [read"%38%8%39%9%40%10%36%14%42%18%61%109$4@$3@$2@$1@$0@@%110%107$4@$3@$1@$2@$0@%89@@%88@%17%84%13%86%101%16%11%86%101%33%22%71%71%96%82%20%55$0@%57%83$0@$7@@%64%80@%113%91$11@@%92$10@@$0@$6@@@@|@@@%96$1@@@%76%115$9@$10@$5@$4@@%96%82%20%55$0@%57%83$0@$7@@%64%80@%113%91$11@@%92$10@@$0@$5@@@@|@@@%88@@||@@%95%108$8@$7@@$2@$0@@||@@%95%108$6@$5@@$1@$2@@|@%111%106$5@$4@$2@$3@$1@%89@@%105%79%74%90%72%73%72%73%72%73%103@@@@@@@@@%79%74%90%72%73%73%73%72%73%103@@@@@@@@@%79%74%90%73%72%72%72%73%73%103@@@@@@@@@%79%74%90%72%72%72%72%73%73%103@@@@@@@@@%79%74%90%72%72%73%72%73%73%103@@@@@@@@@%79%74%90%72%72%73%72%73%73%103@@@@@@@@@%79%74%90%72%73%72%73%72%73%103@@@@@@@@@%79%74%90%73%73%72%72%72%73%103@@@@@@@@@%79%74%90%73%72%73%73%72%73%103@@@@@@@@@%79%74%90%72%73%73%72%72%73%103@@@@@@@@@%79%74%90%73%73%72%73%73%103@@@@@@@@%79%74%90%73%72%72%72%72%103@@@@@@@@%79%74%90%73%72%73%73%72%73%103@@@@@@@@@%79%74%90%72%72%72%72%73%73%103@@@@@@@@@%79%74%90%72%72%72%73%73%73%103@@@@@@@@@%79%74%90%72%73%73%72%72%73%103@@@@@@@@@%79%74%90%72%72%73%72%73%73%103@@@@@@@@@%79%74%90%73%72%73%72%73%73%103@@@@@@@@@%79%74%90%73%72%72%72%72%103@@@@@@@@%79%74%90%72%73%73%72%72%73%103@@@@@@@@@%79%74%90%72%73%72%72%73%73%103@@@@@@@@@%79%74%90%72%73%73%72%73%73%103@@@@@@@@@%79%74%90%72%73%72%73%72%73%103@@@@@@@@@%79%74%90%73%73%73%72%73%73%103@@@@@@@@@%79%74%90%73%72%72%72%72%103@@@@@@@@%79%74%90%73%73%72%72%72%73%103@@@@@@@@@%79%74%90%72%73%73%72%73%73%103@@@@@@@@@%79%74%90%73%72%73%72%73%73%103@@@@@@@@@%79%74%90%73%72%72%72%72%103@@@@@@@@%79%74%90%73%73%73%73%72%73%103@@@@@@@@@%79%74%90%72%72%72%72%73%73%103@@@@@@@@@%79%74%90%73%72%72%72%72%103@@@@@@@@%79%74%90%73%72%72%73%72%73%103@@@@@@@@@%79%74%90%72%73%72%73%72%73%103@@@@@@@@@%79%74%90%72%72%72%73%72%73%103@@@@@@@@@%79%74%90%73%72%72%73%72%73%103@@@@@@@@@%79%74%90%72%73%73%72%72%73%103@@@@@@@@@%79%74%90%72%72%73%72%73%73%103@@@@@@@@@%79%74%90%73%72%73%72%73%73%103@@@@@@@@@%79%74%90%73%72%72%72%72%103@@@@@@@@%79%74%90%72%73%73%72%72%73%103@@@@@@@@@%79%74%90%72%73%72%72%73%73%103@@@@@@@@@%79%74%90%72%73%73%72%73%73%103@@@@@@@@@%79%74%90%72%73%72%73%72%73%103@@@@@@@@@%79%74%90%73%73%73%72%73%73%103@@@@@@@@@%87@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%13$0|@@|@@|@|@|@|@|@"])
  fun op findLowestKVWithKEquivTo_ind x = x
    val op findLowestKVWithKEquivTo_ind =
    DT(((("multimap",2),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%41%0%68%38%8%39%9%36%14%40%10%42%21%44%19%68%57%46%25%42%15%47%28%45%30%42%12%36%4%37%5%36%2%37%3%68%57%63%104%108$14@$13@@$10@@%98$8@@@%57%66$8@%54$7@$6@@@%57%67$6@%56$5@$4@@@%57%65$5@%48$3@$2@@@%57$11$12@$3@@%65%48$1@$0@@%111$9@%48$3@$2@@%24%117$0@%6%7%78%115$16@$17@%48$6@$5@@%48$1@$0@@@%48$6@$5@@%48$1@$0@@||@|@@@@@@@@$15$14@$13@$12@$11@$7@%97%48$1@$0@@@@|@|@|@|@|@|@|@|@|@@%57%46%25%42%15%47%28%45%30%42%12%36%4%37%5%68%57%63%104%108$12@$11@@$8@@%98$6@@@%57%66$6@%54$5@$4@@@%57%67$4@%56$3@$2@@@%57%65$3@%48$1@$0@@@%57%121$9$10@$1@@@%121%94$12@$10@$1@@@@@@@@$13$12@$11@$10@$9@$2@$7@@|@|@|@|@|@|@|@@%46%25%42%15%47%28%45%30%42%12%36%4%37%5%68%57%63%104%108$12@$11@@$8@@%98$6@@@%57%66$6@%54$5@$4@@@%57%67$4@%56$3@$2@@@%57%65$3@%48$1@$0@@@%57%121$9$10@$1@@@%94$12@$10@$1@@@@@@@$13$12@$11@$10@$9@$5@$7@@|@|@|@|@|@|@|@@@@$6$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@@%38%23%39%26%36%27%40%29%42%31%44%32$6$5@$4@$3@$2@$1@$0@|@|@|@|@|@|@@|@",
        read"%44%19%36%14%40%10%42%21%39%9%38%8%46%25%42%15%47%28%45%30%42%12%36%4%37%5%36%2%37%3%68%57%63%104%108$9@$10@@$11@@%98$8@@@%57%66$8@%54$7@$6@@@%57%67$6@%56$5@$4@@@%57%65$5@%48$3@$2@@@%57$12$13@$3@@%65%48$1@$0@@%111$14@%48$3@$2@@%24%117$0@%6%7%78%115$13@$12@%48$6@$5@@%48$1@$0@@@%48$6@$5@@%48$1@$0@@||@|@@@@@@@@%1%50$9@%51$10@%49$13@%52$12@%53$7@%97%48$1@$0@@@@@@@@%50$9@%51$10@%49$13@%52$12@%53$11@$14@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%44%19%36%14%40%10%42%21%39%9%38%8%46%25%42%15%47%28%45%30%42%12%36%4%37%5%68%57%63%104%108$7@$8@@$9@@%98$6@@@%57%66$6@%54$5@$4@@@%57%67$4@%56$3@$2@@@%57%65$3@%48$1@$0@@@%57%121$10$11@$1@@@%121%94$7@$11@$1@@@@@@@@%1%50$7@%51$8@%49$11@%52$10@%53$2@$12@@@@@@%50$7@%51$8@%49$11@%52$10@%53$9@$12@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%44%19%36%14%40%10%42%21%39%9%38%8%46%25%42%15%47%28%45%30%42%12%36%4%37%5%68%57%63%104%108$7@$8@@$9@@%98$6@@@%57%66$6@%54$5@$4@@@%57%67$4@%56$3@$2@@@%57%65$3@%48$1@$0@@@%57%121$10$11@$1@@@%94$7@$11@$1@@@@@@@%1%50$7@%51$8@%49$11@%52$10@%53$5@$12@@@@@@%50$7@%51$8@%49$11@%52$10@%53$9@$12@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%102%1@"])
  fun op findLowestKVWithKEquivTo_def x = x
    val op findLowestKVWithKEquivTo_def =
    DT(((("multimap",3),
        [("bool",[15,57,122,128]),("combin",[19]),("multimap",[0,1]),
         ("option",[69]),("pair",[7,16,49,51]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%42%21%44%19%36%14%40%10%39%9%38%8%62%107$0@$1@$3@$2@$5@$4@@%112%104%108$0@$1@@$5@@$4@%25%118$0@%15%28%119$0@%30%12%116$1@%4%5%77$9$10@$1@@%85%100%2%3%107$9@$10@$12@$11@$7@%97%48$1@$0@@@||@@%111$11@%48$1@$0@@%24%117$0@%6%7%78%115$11@$10@%48$4@$3@@%48$1@$0@@@%48$4@$3@@%48$1@$0@@||@|@@@%77%94$7@$10@$1@@%107$7@$8@$10@$9@$5@$11@@%107$7@$8@$10@$9@$2@$11@@@||@||@||@|@@|@|@|@|@|@|@",
        read"%44%19%36%14%40%10%42%21%39%9%38%8%46%25%42%15%47%28%45%30%42%12%36%4%37%5%36%2%37%3%68%57%63%104%108$9@$10@@$11@@%98$8@@@%57%66$8@%54$7@$6@@@%57%67$6@%56$5@$4@@@%57%65$5@%48$3@$2@@@%57$12$13@$3@@%65%48$1@$0@@%111$14@%48$3@$2@@%24%117$0@%6%7%78%115$13@$12@%48$6@$5@@%48$1@$0@@@%48$6@$5@@%48$1@$0@@||@|@@@@@@@@%1%50$9@%51$10@%49$13@%52$12@%53$7@%97%48$1@$0@@@@@@@@%50$9@%51$10@%49$13@%52$12@%53$11@$14@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%44%19%36%14%40%10%42%21%39%9%38%8%46%25%42%15%47%28%45%30%42%12%36%4%37%5%68%57%63%104%108$7@$8@@$9@@%98$6@@@%57%66$6@%54$5@$4@@@%57%67$4@%56$3@$2@@@%57%65$3@%48$1@$0@@@%57%121$10$11@$1@@@%121%94$7@$11@$1@@@@@@@@%1%50$7@%51$8@%49$11@%52$10@%53$2@$12@@@@@@%50$7@%51$8@%49$11@%52$10@%53$9@$12@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%44%19%36%14%40%10%42%21%39%9%38%8%46%25%42%15%47%28%45%30%42%12%36%4%37%5%68%57%63%104%108$7@$8@@$9@@%98$6@@@%57%66$6@%54$5@$4@@@%57%67$4@%56$3@$2@@@%57%65$3@%48$1@$0@@@%57%121$10$11@$1@@@%94$7@$11@$1@@@@@@@%1%50$7@%51$8@%49$11@%52$10@%53$5@$12@@@@@@%50$7@%51$8@%49$11@%52$10@%53$9@$12@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%102%1@"])
  fun op findHighestKVWithKEquivTo_ind x = x
    val op findHighestKVWithKEquivTo_ind =
    DT(((("multimap",7),
        [("bool",[25,27,52,53,62]),("pair",[5,16]),("relation",[101]),
         ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
       [read"%41%0%68%38%8%39%9%36%14%40%10%42%21%44%19%68%57%46%25%42%15%47%28%45%30%42%12%36%4%37%5%36%2%37%3%68%57%63%104%108$14@$13@@$10@@%98$8@@@%57%66$8@%54$7@$6@@@%57%67$6@%56$5@$4@@@%57%65$5@%48$3@$2@@@%57$11$12@$3@@%65%48$1@$0@@%111$9@%48$3@$2@@%24%117$0@%6%7%78%114$17@$16@%48$6@$5@@%48$1@$0@@@%48$6@$5@@%48$1@$0@@||@|@@@@@@@@$15$14@$13@$12@$11@$4@%97%48$1@$0@@@@|@|@|@|@|@|@|@|@|@@%57%46%25%42%15%47%28%45%30%42%12%36%4%37%5%68%57%63%104%108$12@$11@@$8@@%98$6@@@%57%66$6@%54$5@$4@@@%57%67$4@%56$3@$2@@@%57%65$3@%48$1@$0@@@%57%121$9$10@$1@@@%121%93$12@$10@$1@@@@@@@@$13$12@$11@$10@$9@$5@$7@@|@|@|@|@|@|@|@@%46%25%42%15%47%28%45%30%42%12%36%4%37%5%68%57%63%104%108$12@$11@@$8@@%98$6@@@%57%66$6@%54$5@$4@@@%57%67$4@%56$3@$2@@@%57%65$3@%48$1@$0@@@%57%121$9$10@$1@@@%93$12@$10@$1@@@@@@@$13$12@$11@$10@$9@$2@$7@@|@|@|@|@|@|@|@@@@$6$5@$4@$3@$2@$1@$0@@|@|@|@|@|@|@@%38%23%39%26%36%27%40%29%42%31%44%32$6$5@$4@$3@$2@$1@$0@|@|@|@|@|@|@@|@",
        read"%44%19%36%14%40%10%42%21%39%9%38%8%46%25%42%15%47%28%45%30%42%12%36%4%37%5%36%2%37%3%68%57%63%104%108$9@$10@@$11@@%98$8@@@%57%66$8@%54$7@$6@@@%57%67$6@%56$5@$4@@@%57%65$5@%48$3@$2@@@%57$12$13@$3@@%65%48$1@$0@@%111$14@%48$3@$2@@%24%117$0@%6%7%78%114$12@$13@%48$6@$5@@%48$1@$0@@@%48$6@$5@@%48$1@$0@@||@|@@@@@@@@%1%50$9@%51$10@%49$13@%52$12@%53$4@%97%48$1@$0@@@@@@@@%50$9@%51$10@%49$13@%52$12@%53$11@$14@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%44%19%36%14%40%10%42%21%39%9%38%8%46%25%42%15%47%28%45%30%42%12%36%4%37%5%68%57%63%104%108$7@$8@@$9@@%98$6@@@%57%66$6@%54$5@$4@@@%57%67$4@%56$3@$2@@@%57%65$3@%48$1@$0@@@%57%121$10$11@$1@@@%121%93$7@$11@$1@@@@@@@@%1%50$7@%51$8@%49$11@%52$10@%53$5@$12@@@@@@%50$7@%51$8@%49$11@%52$10@%53$9@$12@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%44%19%36%14%40%10%42%21%39%9%38%8%46%25%42%15%47%28%45%30%42%12%36%4%37%5%68%57%63%104%108$7@$8@@$9@@%98$6@@@%57%66$6@%54$5@$4@@@%57%67$4@%56$3@$2@@@%57%65$3@%48$1@$0@@@%57%121$10$11@$1@@@%93$7@$11@$1@@@@@@@%1%50$7@%51$8@%49$11@%52$10@%53$2@$12@@@@@@%50$7@%51$8@%49$11@%52$10@%53$9@$12@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%102%1@"])
  fun op findHighestKVWithKEquivTo_def x = x
    val op findHighestKVWithKEquivTo_def =
    DT(((("multimap",8),
        [("bool",[15,57,122,128]),("combin",[19]),("multimap",[5,6]),
         ("option",[69]),("pair",[7,16,49,51]),
         ("relation",[121,126])]),["DISK_THM"]),
       [read"%42%21%44%19%36%14%40%10%39%9%38%8%62%106$0@$1@$3@$2@$5@$4@@%112%104%108$0@$1@@$5@@$4@%25%118$0@%15%28%119$0@%30%12%116$1@%4%5%77$9$10@$1@@%85%100%2%3%106$9@$10@$12@$11@$4@%97%48$1@$0@@@||@@%111$11@%48$1@$0@@%24%117$0@%6%7%78%114$10@$11@%48$4@$3@@%48$1@$0@@@%48$4@$3@@%48$1@$0@@||@|@@@%77%93$7@$10@$1@@%106$7@$8@$10@$9@$2@$11@@%106$7@$8@$10@$9@$5@$11@@@||@||@||@|@@|@|@|@|@|@|@",
        read"%44%19%36%14%40%10%42%21%39%9%38%8%46%25%42%15%47%28%45%30%42%12%36%4%37%5%36%2%37%3%68%57%63%104%108$9@$10@@$11@@%98$8@@@%57%66$8@%54$7@$6@@@%57%67$6@%56$5@$4@@@%57%65$5@%48$3@$2@@@%57$12$13@$3@@%65%48$1@$0@@%111$14@%48$3@$2@@%24%117$0@%6%7%78%114$12@$13@%48$6@$5@@%48$1@$0@@@%48$6@$5@@%48$1@$0@@||@|@@@@@@@@%1%50$9@%51$10@%49$13@%52$12@%53$4@%97%48$1@$0@@@@@@@@%50$9@%51$10@%49$13@%52$12@%53$11@$14@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%44%19%36%14%40%10%42%21%39%9%38%8%46%25%42%15%47%28%45%30%42%12%36%4%37%5%68%57%63%104%108$7@$8@@$9@@%98$6@@@%57%66$6@%54$5@$4@@@%57%67$4@%56$3@$2@@@%57%65$3@%48$1@$0@@@%57%121$10$11@$1@@@%121%93$7@$11@$1@@@@@@@@%1%50$7@%51$8@%49$11@%52$10@%53$5@$12@@@@@@%50$7@%51$8@%49$11@%52$10@%53$9@$12@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%44%19%36%14%40%10%42%21%39%9%38%8%46%25%42%15%47%28%45%30%42%12%36%4%37%5%68%57%63%104%108$7@$8@@$9@@%98$6@@@%57%66$6@%54$5@$4@@@%57%67$4@%56$3@$2@@@%57%65$3@%48$1@$0@@@%57%121$10$11@$1@@@%93$7@$11@$1@@@@@@@%1%50$7@%51$8@%49$11@%52$10@%53$2@$12@@@@@@%50$7@%51$8@%49$11@%52$10@%53$9@$12@@@@@@@|@|@|@|@|@|@|@|@|@|@|@|@|@",
        read"%102%1@"])
  end
  val _ = DB.bindl "multimap"
  [("testEquiv_def",testEquiv_def,DB.Def),
   ("lookupBy0_def",lookupBy0_def,DB.Def),
   ("findLowestKVWithKEquivTo_ind",findLowestKVWithKEquivTo_ind,DB.Thm),
   ("findLowestKVWithKEquivTo_def",findLowestKVWithKEquivTo_def,DB.Thm),
   ("findHighestKVWithKEquivTo_ind",findHighestKVWithKEquivTo_ind,DB.Thm),
   ("findHighestKVWithKEquivTo_def",findHighestKVWithKEquivTo_def,DB.Thm)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("missing_pervasivesTheory.missing_pervasives_grammars",
                          missing_pervasivesTheory.missing_pervasives_grammars),
                         ("lem_set_extraTheory.lem_set_extra_grammars",
                          lem_set_extraTheory.lem_set_extra_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="multimap",Name="multimap"}, (T"prod" "pair" [U"'k", U"'v"] --> bool))
  val _ = update_grms
       temp_thytype_abbrev
       ({Thy="multimap",Name="key_equiv"}, (U"'k" --> (U"'k" --> bool)))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("findLowestKVWithKEquivTo", (Term.prim_mk_const { Name = "findLowestKVWithKEquivTo", Thy = "multimap"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("findLowestKVWithKEquivTo", (Term.prim_mk_const { Name = "findLowestKVWithKEquivTo", Thy = "multimap"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("testEquiv", (Term.prim_mk_const { Name = "testEquiv", Thy = "multimap"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("testEquiv", (Term.prim_mk_const { Name = "testEquiv", Thy = "multimap"}))


  val _ = update_grms
       (UTOFF temp_overload_on)
       ("findHighestKVWithKEquivTo", (Term.prim_mk_const { Name = "findHighestKVWithKEquivTo", Thy = "multimap"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("findHighestKVWithKEquivTo", (Term.prim_mk_const { Name = "findHighestKVWithKEquivTo", Thy = "multimap"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("lookupBy0", (Term.prim_mk_const { Name = "lookupBy0", Thy = "multimap"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("lookupBy0", (Term.prim_mk_const { Name = "lookupBy0", Thy = "multimap"}))
  val multimap_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "multimap",
    thydataty = "compute",
    data = "multimap.testEquiv_def multimap.lookupBy0_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "multimap"
end
