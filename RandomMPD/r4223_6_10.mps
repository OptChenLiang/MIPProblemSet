* This file was automatically generated by Zimpl
* param Q2 := 1;
* do print file2;
* param nC := read file1 as "1n" use 1;
* param nN := read file1 as "2n" use 1;
* param m  := read file1 as "3n" use 1;
* param nT := read file1 as "4n" use 1;
* param nP := read file2 as "1n" use 1;
* set C := { 1 .. nC };
* set N := { 1 .. nN };
* set T0 := { 0 .. nT };
* set T := { 1 .. nT };
* set P := { 1 .. nP };
* param inveCost[N] := read file1 as "<1n> 2n" skip 1 use nN;
* param backCost[N] := read file1 as "<1n> 2n" skip nN+1 use nN;
* param demand[C*N*T] := read file1 as "<1n,2n,3n> 4n" skip 2*nN+1;
* param q[P*N] := read file2 as "<1n,2n> 3n" skip 1;
* param D[<c,i> in C*N] := ceil( sum <t> in T : demand[c,i,t]/Q2 );
* set Pc[<c> in C] := inter <i> in { <i> in N with ( sum <t> in T : demand[c,i,t] ) > 0 } : { <j> in P with q[j,i] > 0 };
* param M[<c,j> in C*P] := max <i> in N : ceil( sum <t> in T : demand[c,i,t]/Q2/q[j,i] );
* var B[C*N*T0] >= 0;
* var I[C*N*T0] >= 0;
* var f[C*N*T] integer >= 0;
* var y[C*P*T] integer >= 0;
* var p[P] binary;
* minimize cost: sum <i> in N: ( sum <t> in T: (sum <c> in C : (inveCost[i] * I[c,i,t]  + backCost[i] * B[c,i,t]) ));
* subto select:       sum <j> in P: p[j] <= m;
* subto balance:    forall <c,i,t> in C*N*T with t>=1 do       I[c,i,t-1] - B[c,i,t-1] + Q1*Q2*f[c,i,t] + Q2 * (sum <j> in Pc[c
* ]: q[j,i] * y[c,j,t]) == demand[c,i,t] + I[c,i,t] - B[c,i,t];
* subto valid:    forall <c,i> in C*N do       sum <t> in T: ( min(Q1, D[c,i]) * f[c,i,t] + sum <j> in Pc[c]: ( min(q[j,i], D[c
* ,i] ) * y[c,j,t]) ) >= D[c,i];
* subto BigM:    forall <c,j,t> in C*P*T with t>=1 do       y[c,j,t] <= M[c,j] * p[j];
* subto init1:    forall <c,i> in C*N do       I[c,i,0] == 0;
* subto init2:    forall <c,i> in C*N do       B[c,i,0] == 0;
* subto init3:    forall <c,i> in C*N do       B[c,i,nT] == 0;
NAME          mpdp.zpl
ROWS
 N  OBJECTIV          
 L  select_1          
 E  balanc@1          
 E  balanc@2          
 E  balanc@3          
 E  balanc@4          
 E  balanc@5          
 E  balanc@6          
 E  balanc@7          
 E  balanc@8          
 E  balanc@9          
 E  balanc@a          
 E  balanc@b          
 E  balanc@c          
 E  balanc@d          
 E  balanc@e          
 E  balanc@f          
 E  balan@10          
 E  balan@11          
 E  balan@12          
 E  balan@13          
 E  balan@14          
 E  balan@15          
 E  balan@16          
 E  balan@17          
 E  balan@18          
 G  valid_1           
 G  valid_2           
 G  valid_3           
 G  valid_4           
 G  valid_5           
 G  valid_6           
 L  BigM_1            
 L  BigM_2            
 L  BigM_3            
 L  BigM_4            
 L  BigM_5            
 L  BigM_6            
 L  BigM_7            
 L  BigM_8            
 L  BigM_9            
 L  BigM_10           
 L  BigM_11           
 L  BigM_12           
 L  BigM_13           
 L  BigM_14           
 L  BigM_15           
 L  BigM_16           
 L  BigM_17           
 L  BigM_18           
 L  BigM_19           
 L  BigM_20           
 L  BigM_21           
 L  BigM_22           
 L  BigM_23           
 L  BigM_24           
 L  BigM_25           
 L  BigM_26           
 L  BigM_27           
 L  BigM_28           
 L  BigM_29           
 L  BigM_30           
 L  BigM_31           
 L  BigM_32           
 L  BigM_33           
 L  BigM_34           
 L  BigM_35           
 L  BigM_36           
 L  BigM_37           
 L  BigM_38           
 L  BigM_39           
 L  BigM_40           
 L  BigM_41           
 L  BigM_42           
 L  BigM_43           
 L  BigM_44           
 L  BigM_45           
 L  BigM_46           
 L  BigM_47           
 L  BigM_48           
 L  BigM_49           
 L  BigM_50           
 L  BigM_51           
 L  BigM_52           
 L  BigM_53           
 L  BigM_54           
 L  BigM_55           
 L  BigM_56           
 L  BigM_57           
 L  BigM_58           
 L  BigM_59           
 L  BigM_60           
 L  BigM_61           
 L  BigM_62           
 L  BigM_63           
 L  BigM_64           
 L  BigM_65           
 L  BigM_66           
 L  BigM_67           
 L  BigM_68           
 L  BigM_69           
 L  BigM_70           
 L  BigM_71           
 L  BigM_72           
 E  init1_1           
 E  init1_2           
 E  init1_3           
 E  init1_4           
 E  init1_5           
 E  init1_6           
 E  init1_7           
 E  init1_8           
 E  init2_1           
 E  init2_2           
 E  init2_3           
 E  init2_4           
 E  init2_5           
 E  init2_6           
 E  init2_7           
 E  init2_8           
 E  init3_1           
 E  init3_2           
 E  init3_3           
 E  init3_4           
 E  init3_5           
 E  init3_6           
 E  init3_7           
 E  init3_8           
COLUMNS
    MARK0000  'MARKER'                 'INTORG'
    f#1#1#1   valid_1             72
    f#1#1#1   balanc@1            72
    f#1#1#2   valid_1             72
    f#1#1#2   balanc@2            72
    f#1#1#3   valid_1             72
    f#1#1#3   balanc@3            72
    f#1#2#1   balanc@4            72
    f#1#2#2   balanc@5            72
    f#1#2#3   balanc@6            72
    f#2#1#1   valid_2             72
    f#2#1#1   balanc@7            72
    f#2#1#2   valid_2             72
    f#2#1#2   balanc@8            72
    f#2#1#3   valid_2             72
    f#2#1#3   balanc@9            72
    f#2#2#1   valid_3             72
    f#2#2#1   balanc@a            72
    f#2#2#2   valid_3             72
    f#2#2#2   balanc@b            72
    f#2#2#3   valid_3             72
    f#2#2#3   balanc@c            72
    f#3#1#1   valid_4             72
    f#3#1#1   balanc@d            72
    f#3#1#2   valid_4             72
    f#3#1#2   balanc@e            72
    f#3#1#3   valid_4             72
    f#3#1#3   balanc@f            72
    f#3#2#1   valid_5             72
    f#3#2#1   balan@10            72
    f#3#2#2   valid_5             72
    f#3#2#2   balan@11            72
    f#3#2#3   valid_5             72
    f#3#2#3   balan@12            72
    f#4#1#1   balan@13            72
    f#4#1#2   balan@14            72
    f#4#1#3   balan@15            72
    f#4#2#1   valid_6             72
    f#4#2#1   balan@16            72
    f#4#2#2   valid_6             72
    f#4#2#2   balan@17            72
    f#4#2#3   valid_6             72
    f#4#2#3   balan@18            72
    y#1#1#1   BigM_1               1
    y#1#1#1   valid_1             38
    y#1#1#1   balanc@4            34
    y#1#1#1   balanc@1            38
    y#1#1#2   BigM_2               1
    y#1#1#2   valid_1             38
    y#1#1#2   balanc@5            34
    y#1#1#2   balanc@2            38
    y#1#1#3   BigM_3               1
    y#1#1#3   valid_1             38
    y#1#1#3   balanc@6            34
    y#1#1#3   balanc@3            38
    y#1#2#1   BigM_4               1
    y#1#2#1   valid_1             48
    y#1#2#1   balanc@4            24
    y#1#2#1   balanc@1            48
    y#1#2#2   BigM_5               1
    y#1#2#2   valid_1             48
    y#1#2#2   balanc@5            24
    y#1#2#2   balanc@2            48
    y#1#2#3   BigM_6               1
    y#1#2#3   valid_1             48
    y#1#2#3   balanc@6            24
    y#1#2#3   balanc@3            48
    y#1#3#1   BigM_7               1
    y#1#3#1   valid_1             53
    y#1#3#1   balanc@4            19
    y#1#3#1   balanc@1            53
    y#1#3#2   BigM_8               1
    y#1#3#2   valid_1             53
    y#1#3#2   balanc@5            19
    y#1#3#2   balanc@2            53
    y#1#3#3   BigM_9               1
    y#1#3#3   valid_1             53
    y#1#3#3   balanc@6            19
    y#1#3#3   balanc@3            53
    y#1#4#1   BigM_10              1
    y#1#4#1   valid_1             25
    y#1#4#1   balanc@4            47
    y#1#4#1   balanc@1            25
    y#1#4#2   BigM_11              1
    y#1#4#2   valid_1             25
    y#1#4#2   balanc@5            47
    y#1#4#2   balanc@2            25
    y#1#4#3   BigM_12              1
    y#1#4#3   valid_1             25
    y#1#4#3   balanc@6            47
    y#1#4#3   balanc@3            25
    y#1#5#1   BigM_13              1
    y#1#5#1   valid_1             62
    y#1#5#1   balanc@4            10
    y#1#5#1   balanc@1            62
    y#1#5#2   BigM_14              1
    y#1#5#2   valid_1             62
    y#1#5#2   balanc@5            10
    y#1#5#2   balanc@2            62
    y#1#5#3   BigM_15              1
    y#1#5#3   valid_1             62
    y#1#5#3   balanc@6            10
    y#1#5#3   balanc@3            62
    y#1#6#1   BigM_16              1
    y#1#6#1   valid_1             71
    y#1#6#1   balanc@4             1
    y#1#6#1   balanc@1            71
    y#1#6#2   BigM_17              1
    y#1#6#2   valid_1             71
    y#1#6#2   balanc@5             1
    y#1#6#2   balanc@2            71
    y#1#6#3   BigM_18              1
    y#1#6#3   valid_1             71
    y#1#6#3   balanc@6             1
    y#1#6#3   balanc@3            71
    y#2#1#1   BigM_19              1
    y#2#1#1   valid_3             34
    y#2#1#1   valid_2             38
    y#2#1#1   balanc@a            34
    y#2#1#1   balanc@7            38
    y#2#1#2   BigM_20              1
    y#2#1#2   valid_3             34
    y#2#1#2   valid_2             38
    y#2#1#2   balanc@b            34
    y#2#1#2   balanc@8            38
    y#2#1#3   BigM_21              1
    y#2#1#3   valid_3             34
    y#2#1#3   valid_2             38
    y#2#1#3   balanc@c            34
    y#2#1#3   balanc@9            38
    y#2#2#1   BigM_22              1
    y#2#2#1   valid_3             24
    y#2#2#1   valid_2             48
    y#2#2#1   balanc@a            24
    y#2#2#1   balanc@7            48
    y#2#2#2   BigM_23              1
    y#2#2#2   valid_3             24
    y#2#2#2   valid_2             48
    y#2#2#2   balanc@b            24
    y#2#2#2   balanc@8            48
    y#2#2#3   BigM_24              1
    y#2#2#3   valid_3             24
    y#2#2#3   valid_2             48
    y#2#2#3   balanc@c            24
    y#2#2#3   balanc@9            48
    y#2#3#1   BigM_25              1
    y#2#3#1   valid_3             19
    y#2#3#1   valid_2             53
    y#2#3#1   balanc@a            19
    y#2#3#1   balanc@7            53
    y#2#3#2   BigM_26              1
    y#2#3#2   valid_3             19
    y#2#3#2   valid_2             53
    y#2#3#2   balanc@b            19
    y#2#3#2   balanc@8            53
    y#2#3#3   BigM_27              1
    y#2#3#3   valid_3             19
    y#2#3#3   valid_2             53
    y#2#3#3   balanc@c            19
    y#2#3#3   balanc@9            53
    y#2#4#1   BigM_28              1
    y#2#4#1   valid_3             47
    y#2#4#1   valid_2             25
    y#2#4#1   balanc@a            47
    y#2#4#1   balanc@7            25
    y#2#4#2   BigM_29              1
    y#2#4#2   valid_3             47
    y#2#4#2   valid_2             25
    y#2#4#2   balanc@b            47
    y#2#4#2   balanc@8            25
    y#2#4#3   BigM_30              1
    y#2#4#3   valid_3             47
    y#2#4#3   valid_2             25
    y#2#4#3   balanc@c            47
    y#2#4#3   balanc@9            25
    y#2#5#1   BigM_31              1
    y#2#5#1   valid_3             10
    y#2#5#1   valid_2             62
    y#2#5#1   balanc@a            10
    y#2#5#1   balanc@7            62
    y#2#5#2   BigM_32              1
    y#2#5#2   valid_3             10
    y#2#5#2   valid_2             62
    y#2#5#2   balanc@b            10
    y#2#5#2   balanc@8            62
    y#2#5#3   BigM_33              1
    y#2#5#3   valid_3             10
    y#2#5#3   valid_2             62
    y#2#5#3   balanc@c            10
    y#2#5#3   balanc@9            62
    y#2#6#1   BigM_34              1
    y#2#6#1   valid_3              1
    y#2#6#1   valid_2             71
    y#2#6#1   balanc@a             1
    y#2#6#1   balanc@7            71
    y#2#6#2   BigM_35              1
    y#2#6#2   valid_3              1
    y#2#6#2   valid_2             71
    y#2#6#2   balanc@b             1
    y#2#6#2   balanc@8            71
    y#2#6#3   BigM_36              1
    y#2#6#3   valid_3              1
    y#2#6#3   valid_2             71
    y#2#6#3   balanc@c             1
    y#2#6#3   balanc@9            71
    y#3#1#1   BigM_37              1
    y#3#1#1   valid_5             34
    y#3#1#1   valid_4             38
    y#3#1#1   balan@10            34
    y#3#1#1   balanc@d            38
    y#3#1#2   BigM_38              1
    y#3#1#2   valid_5             34
    y#3#1#2   valid_4             38
    y#3#1#2   balan@11            34
    y#3#1#2   balanc@e            38
    y#3#1#3   BigM_39              1
    y#3#1#3   valid_5             34
    y#3#1#3   valid_4             38
    y#3#1#3   balan@12            34
    y#3#1#3   balanc@f            38
    y#3#2#1   BigM_40              1
    y#3#2#1   valid_5             24
    y#3#2#1   valid_4             48
    y#3#2#1   balan@10            24
    y#3#2#1   balanc@d            48
    y#3#2#2   BigM_41              1
    y#3#2#2   valid_5             24
    y#3#2#2   valid_4             48
    y#3#2#2   balan@11            24
    y#3#2#2   balanc@e            48
    y#3#2#3   BigM_42              1
    y#3#2#3   valid_5             24
    y#3#2#3   valid_4             48
    y#3#2#3   balan@12            24
    y#3#2#3   balanc@f            48
    y#3#3#1   BigM_43              1
    y#3#3#1   valid_5             19
    y#3#3#1   valid_4             53
    y#3#3#1   balan@10            19
    y#3#3#1   balanc@d            53
    y#3#3#2   BigM_44              1
    y#3#3#2   valid_5             19
    y#3#3#2   valid_4             53
    y#3#3#2   balan@11            19
    y#3#3#2   balanc@e            53
    y#3#3#3   BigM_45              1
    y#3#3#3   valid_5             19
    y#3#3#3   valid_4             53
    y#3#3#3   balan@12            19
    y#3#3#3   balanc@f            53
    y#3#4#1   BigM_46              1
    y#3#4#1   valid_5             47
    y#3#4#1   valid_4             25
    y#3#4#1   balan@10            47
    y#3#4#1   balanc@d            25
    y#3#4#2   BigM_47              1
    y#3#4#2   valid_5             47
    y#3#4#2   valid_4             25
    y#3#4#2   balan@11            47
    y#3#4#2   balanc@e            25
    y#3#4#3   BigM_48              1
    y#3#4#3   valid_5             47
    y#3#4#3   valid_4             25
    y#3#4#3   balan@12            47
    y#3#4#3   balanc@f            25
    y#3#5#1   BigM_49              1
    y#3#5#1   valid_5             10
    y#3#5#1   valid_4             62
    y#3#5#1   balan@10            10
    y#3#5#1   balanc@d            62
    y#3#5#2   BigM_50              1
    y#3#5#2   valid_5             10
    y#3#5#2   valid_4             62
    y#3#5#2   balan@11            10
    y#3#5#2   balanc@e            62
    y#3#5#3   BigM_51              1
    y#3#5#3   valid_5             10
    y#3#5#3   valid_4             62
    y#3#5#3   balan@12            10
    y#3#5#3   balanc@f            62
    y#3#6#1   BigM_52              1
    y#3#6#1   valid_5              1
    y#3#6#1   valid_4             71
    y#3#6#1   balan@10             1
    y#3#6#1   balanc@d            71
    y#3#6#2   BigM_53              1
    y#3#6#2   valid_5              1
    y#3#6#2   valid_4             71
    y#3#6#2   balan@11             1
    y#3#6#2   balanc@e            71
    y#3#6#3   BigM_54              1
    y#3#6#3   valid_5              1
    y#3#6#3   valid_4             71
    y#3#6#3   balan@12             1
    y#3#6#3   balanc@f            71
    y#4#1#1   BigM_55              1
    y#4#1#1   valid_6             34
    y#4#1#1   balan@16            34
    y#4#1#1   balan@13            38
    y#4#1#2   BigM_56              1
    y#4#1#2   valid_6             34
    y#4#1#2   balan@17            34
    y#4#1#2   balan@14            38
    y#4#1#3   BigM_57              1
    y#4#1#3   valid_6             34
    y#4#1#3   balan@18            34
    y#4#1#3   balan@15            38
    y#4#2#1   BigM_58              1
    y#4#2#1   valid_6             24
    y#4#2#1   balan@16            24
    y#4#2#1   balan@13            48
    y#4#2#2   BigM_59              1
    y#4#2#2   valid_6             24
    y#4#2#2   balan@17            24
    y#4#2#2   balan@14            48
    y#4#2#3   BigM_60              1
    y#4#2#3   valid_6             24
    y#4#2#3   balan@18            24
    y#4#2#3   balan@15            48
    y#4#3#1   BigM_61              1
    y#4#3#1   valid_6             19
    y#4#3#1   balan@16            19
    y#4#3#1   balan@13            53
    y#4#3#2   BigM_62              1
    y#4#3#2   valid_6             19
    y#4#3#2   balan@17            19
    y#4#3#2   balan@14            53
    y#4#3#3   BigM_63              1
    y#4#3#3   valid_6             19
    y#4#3#3   balan@18            19
    y#4#3#3   balan@15            53
    y#4#4#1   BigM_64              1
    y#4#4#1   valid_6             47
    y#4#4#1   balan@16            47
    y#4#4#1   balan@13            25
    y#4#4#2   BigM_65              1
    y#4#4#2   valid_6             47
    y#4#4#2   balan@17            47
    y#4#4#2   balan@14            25
    y#4#4#3   BigM_66              1
    y#4#4#3   valid_6             47
    y#4#4#3   balan@18            47
    y#4#4#3   balan@15            25
    y#4#5#1   BigM_67              1
    y#4#5#1   valid_6             10
    y#4#5#1   balan@16            10
    y#4#5#1   balan@13            62
    y#4#5#2   BigM_68              1
    y#4#5#2   valid_6             10
    y#4#5#2   balan@17            10
    y#4#5#2   balan@14            62
    y#4#5#3   BigM_69              1
    y#4#5#3   valid_6             10
    y#4#5#3   balan@18            10
    y#4#5#3   balan@15            62
    y#4#6#1   BigM_70              1
    y#4#6#1   valid_6              1
    y#4#6#1   balan@16             1
    y#4#6#1   balan@13            71
    y#4#6#2   BigM_71              1
    y#4#6#2   valid_6              1
    y#4#6#2   balan@17             1
    y#4#6#2   balan@14            71
    y#4#6#3   BigM_72              1
    y#4#6#3   valid_6              1
    y#4#6#3   balan@18             1
    y#4#6#3   balan@15            71
    p#1       BigM_57            -70
    p#1       BigM_56            -70
    p#1       BigM_55            -70
    p#1       BigM_39            -29
    p#1       BigM_38            -29
    p#1       BigM_37            -29
    p#1       BigM_21            -42
    p#1       BigM_20            -42
    p#1       BigM_19            -42
    p#1       BigM_3             -35
    p#1       BigM_2             -35
    p#1       BigM_1             -35
    p#1       select_1             1
    p#2       BigM_60            -99
    p#2       BigM_59            -99
    p#2       BigM_58            -99
    p#2       BigM_42            -41
    p#2       BigM_41            -41
    p#2       BigM_40            -41
    p#2       BigM_24            -37
    p#2       BigM_23            -37
    p#2       BigM_22            -37
    p#2       BigM_6             -28
    p#2       BigM_5             -28
    p#2       BigM_4             -28
    p#2       select_1             1
    p#3       BigM_63           -125
    p#3       BigM_62           -125
    p#3       BigM_61           -125
    p#3       BigM_45            -51
    p#3       BigM_44            -51
    p#3       BigM_43            -51
    p#3       BigM_27            -47
    p#3       BigM_26            -47
    p#3       BigM_25            -47
    p#3       BigM_9             -25
    p#3       BigM_8             -25
    p#3       BigM_7             -25
    p#3       select_1             1
    p#4       BigM_66            -51
    p#4       BigM_65            -51
    p#4       BigM_64            -51
    p#4       BigM_48            -38
    p#4       BigM_47            -38
    p#4       BigM_46            -38
    p#4       BigM_30            -63
    p#4       BigM_29            -63
    p#4       BigM_28            -63
    p#4       BigM_12            -53
    p#4       BigM_11            -53
    p#4       BigM_10            -53
    p#4       select_1             1
    p#5       BigM_69           -237
    p#5       BigM_68           -237
    p#5       BigM_67           -237
    p#5       BigM_51            -97
    p#5       BigM_50            -97
    p#5       BigM_49            -97
    p#5       BigM_33            -89
    p#5       BigM_32            -89
    p#5       BigM_31            -89
    p#5       BigM_15            -22
    p#5       BigM_14            -22
    p#5       BigM_13            -22
    p#5       select_1             1
    p#6       BigM_72          -2367
    p#6       BigM_71          -2367
    p#6       BigM_70          -2367
    p#6       BigM_54           -968
    p#6       BigM_53           -968
    p#6       BigM_52           -968
    p#6       BigM_36           -884
    p#6       BigM_35           -884
    p#6       BigM_34           -884
    p#6       BigM_18            -19
    p#6       BigM_17            -19
    p#6       BigM_16            -19
    p#6       select_1             1
    MARK0001  'MARKER'                 'INTEND'
    B#1#1#0   init2_1              1
    B#1#1#0   balanc@1            -1
    B#1#1#1   OBJECTIV             5
    B#1#1#1   balanc@2            -1
    B#1#1#1   balanc@1             1
    B#1#1#2   OBJECTIV             5
    B#1#1#2   balanc@3            -1
    B#1#1#2   balanc@2             1
    B#1#1#3   OBJECTIV             5
    B#1#1#3   init3_1              1
    B#1#1#3   balanc@3             1
    B#1#2#0   init2_2              1
    B#1#2#0   balanc@4            -1
    B#1#2#1   OBJECTIV           5.5
    B#1#2#1   balanc@5            -1
    B#1#2#1   balanc@4             1
    B#1#2#2   OBJECTIV           5.5
    B#1#2#2   balanc@6            -1
    B#1#2#2   balanc@5             1
    B#1#2#3   OBJECTIV           5.5
    B#1#2#3   init3_2              1
    B#1#2#3   balanc@6             1
    B#2#1#0   init2_3              1
    B#2#1#0   balanc@7            -1
    B#2#1#1   OBJECTIV             5
    B#2#1#1   balanc@8            -1
    B#2#1#1   balanc@7             1
    B#2#1#2   OBJECTIV             5
    B#2#1#2   balanc@9            -1
    B#2#1#2   balanc@8             1
    B#2#1#3   OBJECTIV             5
    B#2#1#3   init3_3              1
    B#2#1#3   balanc@9             1
    B#2#2#0   init2_4              1
    B#2#2#0   balanc@a            -1
    B#2#2#1   OBJECTIV           5.5
    B#2#2#1   balanc@b            -1
    B#2#2#1   balanc@a             1
    B#2#2#2   OBJECTIV           5.5
    B#2#2#2   balanc@c            -1
    B#2#2#2   balanc@b             1
    B#2#2#3   OBJECTIV           5.5
    B#2#2#3   init3_4              1
    B#2#2#3   balanc@c             1
    B#3#1#0   init2_5              1
    B#3#1#0   balanc@d            -1
    B#3#1#1   OBJECTIV             5
    B#3#1#1   balanc@e            -1
    B#3#1#1   balanc@d             1
    B#3#1#2   OBJECTIV             5
    B#3#1#2   balanc@f            -1
    B#3#1#2   balanc@e             1
    B#3#1#3   OBJECTIV             5
    B#3#1#3   init3_5              1
    B#3#1#3   balanc@f             1
    B#3#2#0   init2_6              1
    B#3#2#0   balan@10            -1
    B#3#2#1   OBJECTIV           5.5
    B#3#2#1   balan@11            -1
    B#3#2#1   balan@10             1
    B#3#2#2   OBJECTIV           5.5
    B#3#2#2   balan@12            -1
    B#3#2#2   balan@11             1
    B#3#2#3   OBJECTIV           5.5
    B#3#2#3   init3_6              1
    B#3#2#3   balan@12             1
    B#4#1#0   init2_7              1
    B#4#1#0   balan@13            -1
    B#4#1#1   OBJECTIV             5
    B#4#1#1   balan@14            -1
    B#4#1#1   balan@13             1
    B#4#1#2   OBJECTIV             5
    B#4#1#2   balan@15            -1
    B#4#1#2   balan@14             1
    B#4#1#3   OBJECTIV             5
    B#4#1#3   init3_7              1
    B#4#1#3   balan@15             1
    B#4#2#0   init2_8              1
    B#4#2#0   balan@16            -1
    B#4#2#1   OBJECTIV           5.5
    B#4#2#1   balan@17            -1
    B#4#2#1   balan@16             1
    B#4#2#2   OBJECTIV           5.5
    B#4#2#2   balan@18            -1
    B#4#2#2   balan@17             1
    B#4#2#3   OBJECTIV           5.5
    B#4#2#3   init3_8              1
    B#4#2#3   balan@18             1
    I#1#1#0   init1_1              1
    I#1#1#0   balanc@1             1
    I#1#1#1   OBJECTIV             1
    I#1#1#1   balanc@2             1
    I#1#1#1   balanc@1            -1
    I#1#1#2   OBJECTIV             1
    I#1#1#2   balanc@3             1
    I#1#1#2   balanc@2            -1
    I#1#1#3   OBJECTIV             1
    I#1#1#3   balanc@3            -1
    I#1#2#0   init1_2              1
    I#1#2#0   balanc@4             1
    I#1#2#1   OBJECTIV           1.1
    I#1#2#1   balanc@5             1
    I#1#2#1   balanc@4            -1
    I#1#2#2   OBJECTIV           1.1
    I#1#2#2   balanc@6             1
    I#1#2#2   balanc@5            -1
    I#1#2#3   OBJECTIV           1.1
    I#1#2#3   balanc@6            -1
    I#2#1#0   init1_3              1
    I#2#1#0   balanc@7             1
    I#2#1#1   OBJECTIV             1
    I#2#1#1   balanc@8             1
    I#2#1#1   balanc@7            -1
    I#2#1#2   OBJECTIV             1
    I#2#1#2   balanc@9             1
    I#2#1#2   balanc@8            -1
    I#2#1#3   OBJECTIV             1
    I#2#1#3   balanc@9            -1
    I#2#2#0   init1_4              1
    I#2#2#0   balanc@a             1
    I#2#2#1   OBJECTIV           1.1
    I#2#2#1   balanc@b             1
    I#2#2#1   balanc@a            -1
    I#2#2#2   OBJECTIV           1.1
    I#2#2#2   balanc@c             1
    I#2#2#2   balanc@b            -1
    I#2#2#3   OBJECTIV           1.1
    I#2#2#3   balanc@c            -1
    I#3#1#0   init1_5              1
    I#3#1#0   balanc@d             1
    I#3#1#1   OBJECTIV             1
    I#3#1#1   balanc@e             1
    I#3#1#1   balanc@d            -1
    I#3#1#2   OBJECTIV             1
    I#3#1#2   balanc@f             1
    I#3#1#2   balanc@e            -1
    I#3#1#3   OBJECTIV             1
    I#3#1#3   balanc@f            -1
    I#3#2#0   init1_6              1
    I#3#2#0   balan@10             1
    I#3#2#1   OBJECTIV           1.1
    I#3#2#1   balan@11             1
    I#3#2#1   balan@10            -1
    I#3#2#2   OBJECTIV           1.1
    I#3#2#2   balan@12             1
    I#3#2#2   balan@11            -1
    I#3#2#3   OBJECTIV           1.1
    I#3#2#3   balan@12            -1
    I#4#1#0   init1_7              1
    I#4#1#0   balan@13             1
    I#4#1#1   OBJECTIV             1
    I#4#1#1   balan@14             1
    I#4#1#1   balan@13            -1
    I#4#1#2   OBJECTIV             1
    I#4#1#2   balan@15             1
    I#4#1#2   balan@14            -1
    I#4#1#3   OBJECTIV             1
    I#4#1#3   balan@15            -1
    I#4#2#0   init1_8              1
    I#4#2#0   balan@16             1
    I#4#2#1   OBJECTIV           1.1
    I#4#2#1   balan@17             1
    I#4#2#1   balan@16            -1
    I#4#2#2   OBJECTIV           1.1
    I#4#2#2   balan@18             1
    I#4#2#2   balan@17            -1
    I#4#2#3   OBJECTIV           1.1
    I#4#2#3   balan@18            -1
RHS
    RHS       select_1             2
    RHS       balanc@1           964
    RHS       balanc@2            21
    RHS       balanc@3           337
    RHS       balanc@7           333
    RHS       balanc@8           776
    RHS       balanc@9           466
    RHS       balanc@a           239
    RHS       balanc@b           425
    RHS       balanc@c           220
    RHS       balanc@d           136
    RHS       balanc@e           621
    RHS       balanc@f           192
    RHS       balan@10             7
    RHS       balan@11            27
    RHS       balan@12           934
    RHS       balan@16           914
    RHS       balan@17           988
    RHS       balan@18           465
    RHS       valid_1           1322
    RHS       valid_2           1575
    RHS       valid_3            884
    RHS       valid_4            949
    RHS       valid_5            968
    RHS       valid_6           2367
BOUNDS
 LO BOUND     B#1#1#0              0
 PL BOUND     B#1#1#0 
 LO BOUND     B#1#1#1              0
 PL BOUND     B#1#1#1 
 LO BOUND     B#1#1#2              0
 PL BOUND     B#1#1#2 
 LO BOUND     B#1#1#3              0
 PL BOUND     B#1#1#3 
 LO BOUND     B#1#2#0              0
 PL BOUND     B#1#2#0 
 LO BOUND     B#1#2#1              0
 PL BOUND     B#1#2#1 
 LO BOUND     B#1#2#2              0
 PL BOUND     B#1#2#2 
 LO BOUND     B#1#2#3              0
 PL BOUND     B#1#2#3 
 LO BOUND     B#2#1#0              0
 PL BOUND     B#2#1#0 
 LO BOUND     B#2#1#1              0
 PL BOUND     B#2#1#1 
 LO BOUND     B#2#1#2              0
 PL BOUND     B#2#1#2 
 LO BOUND     B#2#1#3              0
 PL BOUND     B#2#1#3 
 LO BOUND     B#2#2#0              0
 PL BOUND     B#2#2#0 
 LO BOUND     B#2#2#1              0
 PL BOUND     B#2#2#1 
 LO BOUND     B#2#2#2              0
 PL BOUND     B#2#2#2 
 LO BOUND     B#2#2#3              0
 PL BOUND     B#2#2#3 
 LO BOUND     B#3#1#0              0
 PL BOUND     B#3#1#0 
 LO BOUND     B#3#1#1              0
 PL BOUND     B#3#1#1 
 LO BOUND     B#3#1#2              0
 PL BOUND     B#3#1#2 
 LO BOUND     B#3#1#3              0
 PL BOUND     B#3#1#3 
 LO BOUND     B#3#2#0              0
 PL BOUND     B#3#2#0 
 LO BOUND     B#3#2#1              0
 PL BOUND     B#3#2#1 
 LO BOUND     B#3#2#2              0
 PL BOUND     B#3#2#2 
 LO BOUND     B#3#2#3              0
 PL BOUND     B#3#2#3 
 LO BOUND     B#4#1#0              0
 PL BOUND     B#4#1#0 
 LO BOUND     B#4#1#1              0
 PL BOUND     B#4#1#1 
 LO BOUND     B#4#1#2              0
 PL BOUND     B#4#1#2 
 LO BOUND     B#4#1#3              0
 PL BOUND     B#4#1#3 
 LO BOUND     B#4#2#0              0
 PL BOUND     B#4#2#0 
 LO BOUND     B#4#2#1              0
 PL BOUND     B#4#2#1 
 LO BOUND     B#4#2#2              0
 PL BOUND     B#4#2#2 
 LO BOUND     B#4#2#3              0
 PL BOUND     B#4#2#3 
 LO BOUND     I#1#1#0              0
 PL BOUND     I#1#1#0 
 LO BOUND     I#1#1#1              0
 PL BOUND     I#1#1#1 
 LO BOUND     I#1#1#2              0
 PL BOUND     I#1#1#2 
 LO BOUND     I#1#1#3              0
 PL BOUND     I#1#1#3 
 LO BOUND     I#1#2#0              0
 PL BOUND     I#1#2#0 
 LO BOUND     I#1#2#1              0
 PL BOUND     I#1#2#1 
 LO BOUND     I#1#2#2              0
 PL BOUND     I#1#2#2 
 LO BOUND     I#1#2#3              0
 PL BOUND     I#1#2#3 
 LO BOUND     I#2#1#0              0
 PL BOUND     I#2#1#0 
 LO BOUND     I#2#1#1              0
 PL BOUND     I#2#1#1 
 LO BOUND     I#2#1#2              0
 PL BOUND     I#2#1#2 
 LO BOUND     I#2#1#3              0
 PL BOUND     I#2#1#3 
 LO BOUND     I#2#2#0              0
 PL BOUND     I#2#2#0 
 LO BOUND     I#2#2#1              0
 PL BOUND     I#2#2#1 
 LO BOUND     I#2#2#2              0
 PL BOUND     I#2#2#2 
 LO BOUND     I#2#2#3              0
 PL BOUND     I#2#2#3 
 LO BOUND     I#3#1#0              0
 PL BOUND     I#3#1#0 
 LO BOUND     I#3#1#1              0
 PL BOUND     I#3#1#1 
 LO BOUND     I#3#1#2              0
 PL BOUND     I#3#1#2 
 LO BOUND     I#3#1#3              0
 PL BOUND     I#3#1#3 
 LO BOUND     I#3#2#0              0
 PL BOUND     I#3#2#0 
 LO BOUND     I#3#2#1              0
 PL BOUND     I#3#2#1 
 LO BOUND     I#3#2#2              0
 PL BOUND     I#3#2#2 
 LO BOUND     I#3#2#3              0
 PL BOUND     I#3#2#3 
 LO BOUND     I#4#1#0              0
 PL BOUND     I#4#1#0 
 LO BOUND     I#4#1#1              0
 PL BOUND     I#4#1#1 
 LO BOUND     I#4#1#2              0
 PL BOUND     I#4#1#2 
 LO BOUND     I#4#1#3              0
 PL BOUND     I#4#1#3 
 LO BOUND     I#4#2#0              0
 PL BOUND     I#4#2#0 
 LO BOUND     I#4#2#1              0
 PL BOUND     I#4#2#1 
 LO BOUND     I#4#2#2              0
 PL BOUND     I#4#2#2 
 LO BOUND     I#4#2#3              0
 PL BOUND     I#4#2#3 
 LO BOUND     f#1#1#1              0
 PL BOUND     f#1#1#1 
 LO BOUND     f#1#1#2              0
 PL BOUND     f#1#1#2 
 LO BOUND     f#1#1#3              0
 PL BOUND     f#1#1#3 
 LO BOUND     f#1#2#1              0
 PL BOUND     f#1#2#1 
 LO BOUND     f#1#2#2              0
 PL BOUND     f#1#2#2 
 LO BOUND     f#1#2#3              0
 PL BOUND     f#1#2#3 
 LO BOUND     f#2#1#1              0
 PL BOUND     f#2#1#1 
 LO BOUND     f#2#1#2              0
 PL BOUND     f#2#1#2 
 LO BOUND     f#2#1#3              0
 PL BOUND     f#2#1#3 
 LO BOUND     f#2#2#1              0
 PL BOUND     f#2#2#1 
 LO BOUND     f#2#2#2              0
 PL BOUND     f#2#2#2 
 LO BOUND     f#2#2#3              0
 PL BOUND     f#2#2#3 
 LO BOUND     f#3#1#1              0
 PL BOUND     f#3#1#1 
 LO BOUND     f#3#1#2              0
 PL BOUND     f#3#1#2 
 LO BOUND     f#3#1#3              0
 PL BOUND     f#3#1#3 
 LO BOUND     f#3#2#1              0
 PL BOUND     f#3#2#1 
 LO BOUND     f#3#2#2              0
 PL BOUND     f#3#2#2 
 LO BOUND     f#3#2#3              0
 PL BOUND     f#3#2#3 
 LO BOUND     f#4#1#1              0
 PL BOUND     f#4#1#1 
 LO BOUND     f#4#1#2              0
 PL BOUND     f#4#1#2 
 LO BOUND     f#4#1#3              0
 PL BOUND     f#4#1#3 
 LO BOUND     f#4#2#1              0
 PL BOUND     f#4#2#1 
 LO BOUND     f#4#2#2              0
 PL BOUND     f#4#2#2 
 LO BOUND     f#4#2#3              0
 PL BOUND     f#4#2#3 
 LO BOUND     y#1#1#1              0
 PL BOUND     y#1#1#1 
 LO BOUND     y#1#1#2              0
 PL BOUND     y#1#1#2 
 LO BOUND     y#1#1#3              0
 PL BOUND     y#1#1#3 
 LO BOUND     y#1#2#1              0
 PL BOUND     y#1#2#1 
 LO BOUND     y#1#2#2              0
 PL BOUND     y#1#2#2 
 LO BOUND     y#1#2#3              0
 PL BOUND     y#1#2#3 
 LO BOUND     y#1#3#1              0
 PL BOUND     y#1#3#1 
 LO BOUND     y#1#3#2              0
 PL BOUND     y#1#3#2 
 LO BOUND     y#1#3#3              0
 PL BOUND     y#1#3#3 
 LO BOUND     y#1#4#1              0
 PL BOUND     y#1#4#1 
 LO BOUND     y#1#4#2              0
 PL BOUND     y#1#4#2 
 LO BOUND     y#1#4#3              0
 PL BOUND     y#1#4#3 
 LO BOUND     y#1#5#1              0
 PL BOUND     y#1#5#1 
 LO BOUND     y#1#5#2              0
 PL BOUND     y#1#5#2 
 LO BOUND     y#1#5#3              0
 PL BOUND     y#1#5#3 
 LO BOUND     y#1#6#1              0
 PL BOUND     y#1#6#1 
 LO BOUND     y#1#6#2              0
 PL BOUND     y#1#6#2 
 LO BOUND     y#1#6#3              0
 PL BOUND     y#1#6#3 
 LO BOUND     y#2#1#1              0
 PL BOUND     y#2#1#1 
 LO BOUND     y#2#1#2              0
 PL BOUND     y#2#1#2 
 LO BOUND     y#2#1#3              0
 PL BOUND     y#2#1#3 
 LO BOUND     y#2#2#1              0
 PL BOUND     y#2#2#1 
 LO BOUND     y#2#2#2              0
 PL BOUND     y#2#2#2 
 LO BOUND     y#2#2#3              0
 PL BOUND     y#2#2#3 
 LO BOUND     y#2#3#1              0
 PL BOUND     y#2#3#1 
 LO BOUND     y#2#3#2              0
 PL BOUND     y#2#3#2 
 LO BOUND     y#2#3#3              0
 PL BOUND     y#2#3#3 
 LO BOUND     y#2#4#1              0
 PL BOUND     y#2#4#1 
 LO BOUND     y#2#4#2              0
 PL BOUND     y#2#4#2 
 LO BOUND     y#2#4#3              0
 PL BOUND     y#2#4#3 
 LO BOUND     y#2#5#1              0
 PL BOUND     y#2#5#1 
 LO BOUND     y#2#5#2              0
 PL BOUND     y#2#5#2 
 LO BOUND     y#2#5#3              0
 PL BOUND     y#2#5#3 
 LO BOUND     y#2#6#1              0
 PL BOUND     y#2#6#1 
 LO BOUND     y#2#6#2              0
 PL BOUND     y#2#6#2 
 LO BOUND     y#2#6#3              0
 PL BOUND     y#2#6#3 
 LO BOUND     y#3#1#1              0
 PL BOUND     y#3#1#1 
 LO BOUND     y#3#1#2              0
 PL BOUND     y#3#1#2 
 LO BOUND     y#3#1#3              0
 PL BOUND     y#3#1#3 
 LO BOUND     y#3#2#1              0
 PL BOUND     y#3#2#1 
 LO BOUND     y#3#2#2              0
 PL BOUND     y#3#2#2 
 LO BOUND     y#3#2#3              0
 PL BOUND     y#3#2#3 
 LO BOUND     y#3#3#1              0
 PL BOUND     y#3#3#1 
 LO BOUND     y#3#3#2              0
 PL BOUND     y#3#3#2 
 LO BOUND     y#3#3#3              0
 PL BOUND     y#3#3#3 
 LO BOUND     y#3#4#1              0
 PL BOUND     y#3#4#1 
 LO BOUND     y#3#4#2              0
 PL BOUND     y#3#4#2 
 LO BOUND     y#3#4#3              0
 PL BOUND     y#3#4#3 
 LO BOUND     y#3#5#1              0
 PL BOUND     y#3#5#1 
 LO BOUND     y#3#5#2              0
 PL BOUND     y#3#5#2 
 LO BOUND     y#3#5#3              0
 PL BOUND     y#3#5#3 
 LO BOUND     y#3#6#1              0
 PL BOUND     y#3#6#1 
 LO BOUND     y#3#6#2              0
 PL BOUND     y#3#6#2 
 LO BOUND     y#3#6#3              0
 PL BOUND     y#3#6#3 
 LO BOUND     y#4#1#1              0
 PL BOUND     y#4#1#1 
 LO BOUND     y#4#1#2              0
 PL BOUND     y#4#1#2 
 LO BOUND     y#4#1#3              0
 PL BOUND     y#4#1#3 
 LO BOUND     y#4#2#1              0
 PL BOUND     y#4#2#1 
 LO BOUND     y#4#2#2              0
 PL BOUND     y#4#2#2 
 LO BOUND     y#4#2#3              0
 PL BOUND     y#4#2#3 
 LO BOUND     y#4#3#1              0
 PL BOUND     y#4#3#1 
 LO BOUND     y#4#3#2              0
 PL BOUND     y#4#3#2 
 LO BOUND     y#4#3#3              0
 PL BOUND     y#4#3#3 
 LO BOUND     y#4#4#1              0
 PL BOUND     y#4#4#1 
 LO BOUND     y#4#4#2              0
 PL BOUND     y#4#4#2 
 LO BOUND     y#4#4#3              0
 PL BOUND     y#4#4#3 
 LO BOUND     y#4#5#1              0
 PL BOUND     y#4#5#1 
 LO BOUND     y#4#5#2              0
 PL BOUND     y#4#5#2 
 LO BOUND     y#4#5#3              0
 PL BOUND     y#4#5#3 
 LO BOUND     y#4#6#1              0
 PL BOUND     y#4#6#1 
 LO BOUND     y#4#6#2              0
 PL BOUND     y#4#6#2 
 LO BOUND     y#4#6#3              0
 PL BOUND     y#4#6#3 
 LO BOUND     p#1                  0
 UP BOUND     p#1                  1
 LO BOUND     p#2                  0
 UP BOUND     p#2                  1
 LO BOUND     p#3                  0
 UP BOUND     p#3                  1
 LO BOUND     p#4                  0
 UP BOUND     p#4                  1
 LO BOUND     p#5                  0
 UP BOUND     p#5                  1
 LO BOUND     p#6                  0
 UP BOUND     p#6                  1
ENDATA
