* This file was automatically generated by Zimpl
* param Q2 := 1;
* do print file2;
* param nC := read file1 as "1n" use 1;
* param nI := read file1 as "2n" use 1;
* param m  := read file1 as "3n" use 1;
* param nT := read file1 as "4n" use 1;
* param nP := read file2 as "1n" use 1;
* set C := { 1 .. nC };
* set I := { 1 .. nI };
* set T0 := { 0 .. nT };
* set T := { 1 .. nT };
* set P := { 1 .. nP };
* param inveCost[I] := read file1 as "<1n> 2n" skip 1 use nI;
* param backCost[I] := read file1 as "<1n> 2n" skip nI+1 use nI;
* param demand[C*I*T] := read file1 as "<1n,2n,3n> 4n" skip 2*nI+1;
* param q[P*I] := read file2 as "<1n,2n> 3n" skip 1;
* param D[<c,i> in C*I] := ceil( sum <t> in T : demand[c,i,t]/Q2 );
* set Pc[<c> in C] := inter <i> in { <i> in I with ( sum <t> in T : demand[c,i,t] ) > 0 } : { <p> in P with q[p,i] > 0 };
* param M[<c,p> in C*P] := max <i> in I with q[p,i] > 0: ceil( sum <t> in T : demand[c,i,t]/Q2/q[p,i] );
* var r[C*I*T0] >= 0;
* var s[C*I*T0] >= 0;
* var x[C*I*T] integer >= 0;
* var y[C*P*T] integer >= 0;
* var z[P] binary;
* minimize cost: sum <i> in I: ( sum <t> in T: (sum <c> in C : (inveCost[i] * s[c,i,t]  + backCost[i] * r[c,i,t]) ));
* subto select:       sum <p> in P: z[p] <= m;
* subto balance:    forall <c,i,t> in C*I*T with t>=1 do       s[c,i,t-1] - r[c,i,t-1] + Q1*Q2*x[c,i,t] + Q2 * (sum <p> in Pc[c
* ]: q[p,i] * y[c,p,t]) == demand[c,i,t] + s[c,i,t] - r[c,i,t];
* subto valid:    forall <c,i> in C*I do       sum <t> in T: ( min(Q1, D[c,i]) * x[c,i,t] + sum <p> in Pc[c]: ( min(q[p,i], D[c
* ,i] ) * y[c,p,t]) ) >= D[c,i];
* subto BigM:    forall <c,p,t> in C*P*T with t>=1 do       y[c,p,t] <= M[c,p] * z[p];
* subto init1:    forall <c,i> in C*I do       s[c,i,0] == 0;
* subto init2:    forall <c,i> in C*I do       r[c,i,0] == 0;
* subto init3:    forall <c,i> in C*I do       r[c,i,nT] == 0;
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
    x#1#1#1   valid_1             72
    x#1#1#1   balanc@1            72
    x#1#1#2   valid_1             72
    x#1#1#2   balanc@2            72
    x#1#1#3   valid_1             72
    x#1#1#3   balanc@3            72
    x#1#2#1   balanc@4            72
    x#1#2#2   balanc@5            72
    x#1#2#3   balanc@6            72
    x#2#1#1   valid_2             72
    x#2#1#1   balanc@7            72
    x#2#1#2   valid_2             72
    x#2#1#2   balanc@8            72
    x#2#1#3   valid_2             72
    x#2#1#3   balanc@9            72
    x#2#2#1   valid_3             72
    x#2#2#1   balanc@a            72
    x#2#2#2   valid_3             72
    x#2#2#2   balanc@b            72
    x#2#2#3   valid_3             72
    x#2#2#3   balanc@c            72
    x#3#1#1   valid_4             72
    x#3#1#1   balanc@d            72
    x#3#1#2   valid_4             72
    x#3#1#2   balanc@e            72
    x#3#1#3   valid_4             72
    x#3#1#3   balanc@f            72
    x#3#2#1   valid_5             72
    x#3#2#1   balan@10            72
    x#3#2#2   valid_5             72
    x#3#2#2   balan@11            72
    x#3#2#3   valid_5             72
    x#3#2#3   balan@12            72
    x#4#1#1   balan@13            72
    x#4#1#2   balan@14            72
    x#4#1#3   balan@15            72
    x#4#2#1   valid_6             72
    x#4#2#1   balan@16            72
    x#4#2#2   valid_6             72
    x#4#2#2   balan@17            72
    x#4#2#3   valid_6             72
    x#4#2#3   balan@18            72
    y#1#1#1   BigM_1               1
    y#1#1#1   valid_1             69
    y#1#1#1   balanc@4             3
    y#1#1#1   balanc@1            69
    y#1#1#2   BigM_2               1
    y#1#1#2   valid_1             69
    y#1#1#2   balanc@5             3
    y#1#1#2   balanc@2            69
    y#1#1#3   BigM_3               1
    y#1#1#3   valid_1             69
    y#1#1#3   balanc@6             3
    y#1#1#3   balanc@3            69
    y#1#2#1   BigM_4               1
    y#1#2#1   valid_1             28
    y#1#2#1   balanc@4            44
    y#1#2#1   balanc@1            28
    y#1#2#2   BigM_5               1
    y#1#2#2   valid_1             28
    y#1#2#2   balanc@5            44
    y#1#2#2   balanc@2            28
    y#1#2#3   BigM_6               1
    y#1#2#3   valid_1             28
    y#1#2#3   balanc@6            44
    y#1#2#3   balanc@3            28
    y#1#3#1   BigM_7               1
    y#1#3#1   valid_1             37
    y#1#3#1   balanc@4            35
    y#1#3#1   balanc@1            37
    y#1#3#2   BigM_8               1
    y#1#3#2   valid_1             37
    y#1#3#2   balanc@5            35
    y#1#3#2   balanc@2            37
    y#1#3#3   BigM_9               1
    y#1#3#3   valid_1             37
    y#1#3#3   balanc@6            35
    y#1#3#3   balanc@3            37
    y#1#4#1   BigM_10              1
    y#1#4#1   valid_1             41
    y#1#4#1   balanc@4            31
    y#1#4#1   balanc@1            41
    y#1#4#2   BigM_11              1
    y#1#4#2   valid_1             41
    y#1#4#2   balanc@5            31
    y#1#4#2   balanc@2            41
    y#1#4#3   BigM_12              1
    y#1#4#3   valid_1             41
    y#1#4#3   balanc@6            31
    y#1#4#3   balanc@3            41
    y#1#5#1   BigM_13              1
    y#1#5#1   valid_1              8
    y#1#5#1   balanc@4            64
    y#1#5#1   balanc@1             8
    y#1#5#2   BigM_14              1
    y#1#5#2   valid_1              8
    y#1#5#2   balanc@5            64
    y#1#5#2   balanc@2             8
    y#1#5#3   BigM_15              1
    y#1#5#3   valid_1              8
    y#1#5#3   balanc@6            64
    y#1#5#3   balanc@3             8
    y#1#6#1   BigM_16              1
    y#1#6#1   valid_1             36
    y#1#6#1   balanc@4            36
    y#1#6#1   balanc@1            36
    y#1#6#2   BigM_17              1
    y#1#6#2   valid_1             36
    y#1#6#2   balanc@5            36
    y#1#6#2   balanc@2            36
    y#1#6#3   BigM_18              1
    y#1#6#3   valid_1             36
    y#1#6#3   balanc@6            36
    y#1#6#3   balanc@3            36
    y#2#1#1   BigM_19              1
    y#2#1#1   valid_3              3
    y#2#1#1   valid_2             69
    y#2#1#1   balanc@a             3
    y#2#1#1   balanc@7            69
    y#2#1#2   BigM_20              1
    y#2#1#2   valid_3              3
    y#2#1#2   valid_2             69
    y#2#1#2   balanc@b             3
    y#2#1#2   balanc@8            69
    y#2#1#3   BigM_21              1
    y#2#1#3   valid_3              3
    y#2#1#3   valid_2             69
    y#2#1#3   balanc@c             3
    y#2#1#3   balanc@9            69
    y#2#2#1   BigM_22              1
    y#2#2#1   valid_3             44
    y#2#2#1   valid_2             28
    y#2#2#1   balanc@a            44
    y#2#2#1   balanc@7            28
    y#2#2#2   BigM_23              1
    y#2#2#2   valid_3             44
    y#2#2#2   valid_2             28
    y#2#2#2   balanc@b            44
    y#2#2#2   balanc@8            28
    y#2#2#3   BigM_24              1
    y#2#2#3   valid_3             44
    y#2#2#3   valid_2             28
    y#2#2#3   balanc@c            44
    y#2#2#3   balanc@9            28
    y#2#3#1   BigM_25              1
    y#2#3#1   valid_3             35
    y#2#3#1   valid_2             37
    y#2#3#1   balanc@a            35
    y#2#3#1   balanc@7            37
    y#2#3#2   BigM_26              1
    y#2#3#2   valid_3             35
    y#2#3#2   valid_2             37
    y#2#3#2   balanc@b            35
    y#2#3#2   balanc@8            37
    y#2#3#3   BigM_27              1
    y#2#3#3   valid_3             35
    y#2#3#3   valid_2             37
    y#2#3#3   balanc@c            35
    y#2#3#3   balanc@9            37
    y#2#4#1   BigM_28              1
    y#2#4#1   valid_3             31
    y#2#4#1   valid_2             41
    y#2#4#1   balanc@a            31
    y#2#4#1   balanc@7            41
    y#2#4#2   BigM_29              1
    y#2#4#2   valid_3             31
    y#2#4#2   valid_2             41
    y#2#4#2   balanc@b            31
    y#2#4#2   balanc@8            41
    y#2#4#3   BigM_30              1
    y#2#4#3   valid_3             31
    y#2#4#3   valid_2             41
    y#2#4#3   balanc@c            31
    y#2#4#3   balanc@9            41
    y#2#5#1   BigM_31              1
    y#2#5#1   valid_3             64
    y#2#5#1   valid_2              8
    y#2#5#1   balanc@a            64
    y#2#5#1   balanc@7             8
    y#2#5#2   BigM_32              1
    y#2#5#2   valid_3             64
    y#2#5#2   valid_2              8
    y#2#5#2   balanc@b            64
    y#2#5#2   balanc@8             8
    y#2#5#3   BigM_33              1
    y#2#5#3   valid_3             64
    y#2#5#3   valid_2              8
    y#2#5#3   balanc@c            64
    y#2#5#3   balanc@9             8
    y#2#6#1   BigM_34              1
    y#2#6#1   valid_3             36
    y#2#6#1   valid_2             36
    y#2#6#1   balanc@a            36
    y#2#6#1   balanc@7            36
    y#2#6#2   BigM_35              1
    y#2#6#2   valid_3             36
    y#2#6#2   valid_2             36
    y#2#6#2   balanc@b            36
    y#2#6#2   balanc@8            36
    y#2#6#3   BigM_36              1
    y#2#6#3   valid_3             36
    y#2#6#3   valid_2             36
    y#2#6#3   balanc@c            36
    y#2#6#3   balanc@9            36
    y#3#1#1   BigM_37              1
    y#3#1#1   valid_5              3
    y#3#1#1   valid_4             69
    y#3#1#1   balan@10             3
    y#3#1#1   balanc@d            69
    y#3#1#2   BigM_38              1
    y#3#1#2   valid_5              3
    y#3#1#2   valid_4             69
    y#3#1#2   balan@11             3
    y#3#1#2   balanc@e            69
    y#3#1#3   BigM_39              1
    y#3#1#3   valid_5              3
    y#3#1#3   valid_4             69
    y#3#1#3   balan@12             3
    y#3#1#3   balanc@f            69
    y#3#2#1   BigM_40              1
    y#3#2#1   valid_5             44
    y#3#2#1   valid_4             28
    y#3#2#1   balan@10            44
    y#3#2#1   balanc@d            28
    y#3#2#2   BigM_41              1
    y#3#2#2   valid_5             44
    y#3#2#2   valid_4             28
    y#3#2#2   balan@11            44
    y#3#2#2   balanc@e            28
    y#3#2#3   BigM_42              1
    y#3#2#3   valid_5             44
    y#3#2#3   valid_4             28
    y#3#2#3   balan@12            44
    y#3#2#3   balanc@f            28
    y#3#3#1   BigM_43              1
    y#3#3#1   valid_5             35
    y#3#3#1   valid_4             37
    y#3#3#1   balan@10            35
    y#3#3#1   balanc@d            37
    y#3#3#2   BigM_44              1
    y#3#3#2   valid_5             35
    y#3#3#2   valid_4             37
    y#3#3#2   balan@11            35
    y#3#3#2   balanc@e            37
    y#3#3#3   BigM_45              1
    y#3#3#3   valid_5             35
    y#3#3#3   valid_4             37
    y#3#3#3   balan@12            35
    y#3#3#3   balanc@f            37
    y#3#4#1   BigM_46              1
    y#3#4#1   valid_5             31
    y#3#4#1   valid_4             41
    y#3#4#1   balan@10            31
    y#3#4#1   balanc@d            41
    y#3#4#2   BigM_47              1
    y#3#4#2   valid_5             31
    y#3#4#2   valid_4             41
    y#3#4#2   balan@11            31
    y#3#4#2   balanc@e            41
    y#3#4#3   BigM_48              1
    y#3#4#3   valid_5             31
    y#3#4#3   valid_4             41
    y#3#4#3   balan@12            31
    y#3#4#3   balanc@f            41
    y#3#5#1   BigM_49              1
    y#3#5#1   valid_5             64
    y#3#5#1   valid_4              8
    y#3#5#1   balan@10            64
    y#3#5#1   balanc@d             8
    y#3#5#2   BigM_50              1
    y#3#5#2   valid_5             64
    y#3#5#2   valid_4              8
    y#3#5#2   balan@11            64
    y#3#5#2   balanc@e             8
    y#3#5#3   BigM_51              1
    y#3#5#3   valid_5             64
    y#3#5#3   valid_4              8
    y#3#5#3   balan@12            64
    y#3#5#3   balanc@f             8
    y#3#6#1   BigM_52              1
    y#3#6#1   valid_5             36
    y#3#6#1   valid_4             36
    y#3#6#1   balan@10            36
    y#3#6#1   balanc@d            36
    y#3#6#2   BigM_53              1
    y#3#6#2   valid_5             36
    y#3#6#2   valid_4             36
    y#3#6#2   balan@11            36
    y#3#6#2   balanc@e            36
    y#3#6#3   BigM_54              1
    y#3#6#3   valid_5             36
    y#3#6#3   valid_4             36
    y#3#6#3   balan@12            36
    y#3#6#3   balanc@f            36
    y#4#1#1   BigM_55              1
    y#4#1#1   valid_6              3
    y#4#1#1   balan@16             3
    y#4#1#1   balan@13            69
    y#4#1#2   BigM_56              1
    y#4#1#2   valid_6              3
    y#4#1#2   balan@17             3
    y#4#1#2   balan@14            69
    y#4#1#3   BigM_57              1
    y#4#1#3   valid_6              3
    y#4#1#3   balan@18             3
    y#4#1#3   balan@15            69
    y#4#2#1   BigM_58              1
    y#4#2#1   valid_6             44
    y#4#2#1   balan@16            44
    y#4#2#1   balan@13            28
    y#4#2#2   BigM_59              1
    y#4#2#2   valid_6             44
    y#4#2#2   balan@17            44
    y#4#2#2   balan@14            28
    y#4#2#3   BigM_60              1
    y#4#2#3   valid_6             44
    y#4#2#3   balan@18            44
    y#4#2#3   balan@15            28
    y#4#3#1   BigM_61              1
    y#4#3#1   valid_6             35
    y#4#3#1   balan@16            35
    y#4#3#1   balan@13            37
    y#4#3#2   BigM_62              1
    y#4#3#2   valid_6             35
    y#4#3#2   balan@17            35
    y#4#3#2   balan@14            37
    y#4#3#3   BigM_63              1
    y#4#3#3   valid_6             35
    y#4#3#3   balan@18            35
    y#4#3#3   balan@15            37
    y#4#4#1   BigM_64              1
    y#4#4#1   valid_6             31
    y#4#4#1   balan@16            31
    y#4#4#1   balan@13            41
    y#4#4#2   BigM_65              1
    y#4#4#2   valid_6             31
    y#4#4#2   balan@17            31
    y#4#4#2   balan@14            41
    y#4#4#3   BigM_66              1
    y#4#4#3   valid_6             31
    y#4#4#3   balan@18            31
    y#4#4#3   balan@15            41
    y#4#5#1   BigM_67              1
    y#4#5#1   valid_6             64
    y#4#5#1   balan@16            64
    y#4#5#1   balan@13             8
    y#4#5#2   BigM_68              1
    y#4#5#2   valid_6             64
    y#4#5#2   balan@17            64
    y#4#5#2   balan@14             8
    y#4#5#3   BigM_69              1
    y#4#5#3   valid_6             64
    y#4#5#3   balan@18            64
    y#4#5#3   balan@15             8
    y#4#6#1   BigM_70              1
    y#4#6#1   valid_6             36
    y#4#6#1   balan@16            36
    y#4#6#1   balan@13            36
    y#4#6#2   BigM_71              1
    y#4#6#2   valid_6             36
    y#4#6#2   balan@17            36
    y#4#6#2   balan@14            36
    y#4#6#3   BigM_72              1
    y#4#6#3   valid_6             36
    y#4#6#3   balan@18            36
    y#4#6#3   balan@15            36
    z#1       BigM_57           -789
    z#1       BigM_56           -789
    z#1       BigM_55           -789
    z#1       BigM_39           -323
    z#1       BigM_38           -323
    z#1       BigM_37           -323
    z#1       BigM_21           -295
    z#1       BigM_20           -295
    z#1       BigM_19           -295
    z#1       BigM_3             -20
    z#1       BigM_2             -20
    z#1       BigM_1             -20
    z#1       select_1             1
    z#2       BigM_60            -54
    z#2       BigM_59            -54
    z#2       BigM_58            -54
    z#2       BigM_42            -34
    z#2       BigM_41            -34
    z#2       BigM_40            -34
    z#2       BigM_24            -57
    z#2       BigM_23            -57
    z#2       BigM_22            -57
    z#2       BigM_6             -48
    z#2       BigM_5             -48
    z#2       BigM_4             -48
    z#2       select_1             1
    z#3       BigM_63            -68
    z#3       BigM_62            -68
    z#3       BigM_61            -68
    z#3       BigM_45            -28
    z#3       BigM_44            -28
    z#3       BigM_43            -28
    z#3       BigM_27            -43
    z#3       BigM_26            -43
    z#3       BigM_25            -43
    z#3       BigM_9             -36
    z#3       BigM_8             -36
    z#3       BigM_7             -36
    z#3       select_1             1
    z#4       BigM_66            -77
    z#4       BigM_65            -77
    z#4       BigM_64            -77
    z#4       BigM_48            -32
    z#4       BigM_47            -32
    z#4       BigM_46            -32
    z#4       BigM_30            -39
    z#4       BigM_29            -39
    z#4       BigM_28            -39
    z#4       BigM_12            -33
    z#4       BigM_11            -33
    z#4       BigM_10            -33
    z#4       select_1             1
    z#5       BigM_69            -37
    z#5       BigM_68            -37
    z#5       BigM_67            -37
    z#5       BigM_51           -119
    z#5       BigM_50           -119
    z#5       BigM_49           -119
    z#5       BigM_33           -197
    z#5       BigM_32           -197
    z#5       BigM_31           -197
    z#5       BigM_15           -166
    z#5       BigM_14           -166
    z#5       BigM_13           -166
    z#5       select_1             1
    z#6       BigM_72            -66
    z#6       BigM_71            -66
    z#6       BigM_70            -66
    z#6       BigM_54            -27
    z#6       BigM_53            -27
    z#6       BigM_52            -27
    z#6       BigM_36            -44
    z#6       BigM_35            -44
    z#6       BigM_34            -44
    z#6       BigM_18            -37
    z#6       BigM_17            -37
    z#6       BigM_16            -37
    z#6       select_1             1
    MARK0001  'MARKER'                 'INTEND'
    r#1#1#0   init2_1              1
    r#1#1#0   balanc@1            -1
    r#1#1#1   OBJECTIV             5
    r#1#1#1   balanc@2            -1
    r#1#1#1   balanc@1             1
    r#1#1#2   OBJECTIV             5
    r#1#1#2   balanc@3            -1
    r#1#1#2   balanc@2             1
    r#1#1#3   OBJECTIV             5
    r#1#1#3   init3_1              1
    r#1#1#3   balanc@3             1
    r#1#2#0   init2_2              1
    r#1#2#0   balanc@4            -1
    r#1#2#1   OBJECTIV           5.5
    r#1#2#1   balanc@5            -1
    r#1#2#1   balanc@4             1
    r#1#2#2   OBJECTIV           5.5
    r#1#2#2   balanc@6            -1
    r#1#2#2   balanc@5             1
    r#1#2#3   OBJECTIV           5.5
    r#1#2#3   init3_2              1
    r#1#2#3   balanc@6             1
    r#2#1#0   init2_3              1
    r#2#1#0   balanc@7            -1
    r#2#1#1   OBJECTIV             5
    r#2#1#1   balanc@8            -1
    r#2#1#1   balanc@7             1
    r#2#1#2   OBJECTIV             5
    r#2#1#2   balanc@9            -1
    r#2#1#2   balanc@8             1
    r#2#1#3   OBJECTIV             5
    r#2#1#3   init3_3              1
    r#2#1#3   balanc@9             1
    r#2#2#0   init2_4              1
    r#2#2#0   balanc@a            -1
    r#2#2#1   OBJECTIV           5.5
    r#2#2#1   balanc@b            -1
    r#2#2#1   balanc@a             1
    r#2#2#2   OBJECTIV           5.5
    r#2#2#2   balanc@c            -1
    r#2#2#2   balanc@b             1
    r#2#2#3   OBJECTIV           5.5
    r#2#2#3   init3_4              1
    r#2#2#3   balanc@c             1
    r#3#1#0   init2_5              1
    r#3#1#0   balanc@d            -1
    r#3#1#1   OBJECTIV             5
    r#3#1#1   balanc@e            -1
    r#3#1#1   balanc@d             1
    r#3#1#2   OBJECTIV             5
    r#3#1#2   balanc@f            -1
    r#3#1#2   balanc@e             1
    r#3#1#3   OBJECTIV             5
    r#3#1#3   init3_5              1
    r#3#1#3   balanc@f             1
    r#3#2#0   init2_6              1
    r#3#2#0   balan@10            -1
    r#3#2#1   OBJECTIV           5.5
    r#3#2#1   balan@11            -1
    r#3#2#1   balan@10             1
    r#3#2#2   OBJECTIV           5.5
    r#3#2#2   balan@12            -1
    r#3#2#2   balan@11             1
    r#3#2#3   OBJECTIV           5.5
    r#3#2#3   init3_6              1
    r#3#2#3   balan@12             1
    r#4#1#0   init2_7              1
    r#4#1#0   balan@13            -1
    r#4#1#1   OBJECTIV             5
    r#4#1#1   balan@14            -1
    r#4#1#1   balan@13             1
    r#4#1#2   OBJECTIV             5
    r#4#1#2   balan@15            -1
    r#4#1#2   balan@14             1
    r#4#1#3   OBJECTIV             5
    r#4#1#3   init3_7              1
    r#4#1#3   balan@15             1
    r#4#2#0   init2_8              1
    r#4#2#0   balan@16            -1
    r#4#2#1   OBJECTIV           5.5
    r#4#2#1   balan@17            -1
    r#4#2#1   balan@16             1
    r#4#2#2   OBJECTIV           5.5
    r#4#2#2   balan@18            -1
    r#4#2#2   balan@17             1
    r#4#2#3   OBJECTIV           5.5
    r#4#2#3   init3_8              1
    r#4#2#3   balan@18             1
    s#1#1#0   init1_1              1
    s#1#1#0   balanc@1             1
    s#1#1#1   OBJECTIV             1
    s#1#1#1   balanc@2             1
    s#1#1#1   balanc@1            -1
    s#1#1#2   OBJECTIV             1
    s#1#1#2   balanc@3             1
    s#1#1#2   balanc@2            -1
    s#1#1#3   OBJECTIV             1
    s#1#1#3   balanc@3            -1
    s#1#2#0   init1_2              1
    s#1#2#0   balanc@4             1
    s#1#2#1   OBJECTIV           1.1
    s#1#2#1   balanc@5             1
    s#1#2#1   balanc@4            -1
    s#1#2#2   OBJECTIV           1.1
    s#1#2#2   balanc@6             1
    s#1#2#2   balanc@5            -1
    s#1#2#3   OBJECTIV           1.1
    s#1#2#3   balanc@6            -1
    s#2#1#0   init1_3              1
    s#2#1#0   balanc@7             1
    s#2#1#1   OBJECTIV             1
    s#2#1#1   balanc@8             1
    s#2#1#1   balanc@7            -1
    s#2#1#2   OBJECTIV             1
    s#2#1#2   balanc@9             1
    s#2#1#2   balanc@8            -1
    s#2#1#3   OBJECTIV             1
    s#2#1#3   balanc@9            -1
    s#2#2#0   init1_4              1
    s#2#2#0   balanc@a             1
    s#2#2#1   OBJECTIV           1.1
    s#2#2#1   balanc@b             1
    s#2#2#1   balanc@a            -1
    s#2#2#2   OBJECTIV           1.1
    s#2#2#2   balanc@c             1
    s#2#2#2   balanc@b            -1
    s#2#2#3   OBJECTIV           1.1
    s#2#2#3   balanc@c            -1
    s#3#1#0   init1_5              1
    s#3#1#0   balanc@d             1
    s#3#1#1   OBJECTIV             1
    s#3#1#1   balanc@e             1
    s#3#1#1   balanc@d            -1
    s#3#1#2   OBJECTIV             1
    s#3#1#2   balanc@f             1
    s#3#1#2   balanc@e            -1
    s#3#1#3   OBJECTIV             1
    s#3#1#3   balanc@f            -1
    s#3#2#0   init1_6              1
    s#3#2#0   balan@10             1
    s#3#2#1   OBJECTIV           1.1
    s#3#2#1   balan@11             1
    s#3#2#1   balan@10            -1
    s#3#2#2   OBJECTIV           1.1
    s#3#2#2   balan@12             1
    s#3#2#2   balan@11            -1
    s#3#2#3   OBJECTIV           1.1
    s#3#2#3   balan@12            -1
    s#4#1#0   init1_7              1
    s#4#1#0   balan@13             1
    s#4#1#1   OBJECTIV             1
    s#4#1#1   balan@14             1
    s#4#1#1   balan@13            -1
    s#4#1#2   OBJECTIV             1
    s#4#1#2   balan@15             1
    s#4#1#2   balan@14            -1
    s#4#1#3   OBJECTIV             1
    s#4#1#3   balan@15            -1
    s#4#2#0   init1_8              1
    s#4#2#0   balan@16             1
    s#4#2#1   OBJECTIV           1.1
    s#4#2#1   balan@17             1
    s#4#2#1   balan@16            -1
    s#4#2#2   OBJECTIV           1.1
    s#4#2#2   balan@18             1
    s#4#2#2   balan@17            -1
    s#4#2#3   OBJECTIV           1.1
    s#4#2#3   balan@18            -1
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
 LO BOUND     r#1#1#0              0
 PL BOUND     r#1#1#0 
 LO BOUND     r#1#1#1              0
 PL BOUND     r#1#1#1 
 LO BOUND     r#1#1#2              0
 PL BOUND     r#1#1#2 
 LO BOUND     r#1#1#3              0
 PL BOUND     r#1#1#3 
 LO BOUND     r#1#2#0              0
 PL BOUND     r#1#2#0 
 LO BOUND     r#1#2#1              0
 PL BOUND     r#1#2#1 
 LO BOUND     r#1#2#2              0
 PL BOUND     r#1#2#2 
 LO BOUND     r#1#2#3              0
 PL BOUND     r#1#2#3 
 LO BOUND     r#2#1#0              0
 PL BOUND     r#2#1#0 
 LO BOUND     r#2#1#1              0
 PL BOUND     r#2#1#1 
 LO BOUND     r#2#1#2              0
 PL BOUND     r#2#1#2 
 LO BOUND     r#2#1#3              0
 PL BOUND     r#2#1#3 
 LO BOUND     r#2#2#0              0
 PL BOUND     r#2#2#0 
 LO BOUND     r#2#2#1              0
 PL BOUND     r#2#2#1 
 LO BOUND     r#2#2#2              0
 PL BOUND     r#2#2#2 
 LO BOUND     r#2#2#3              0
 PL BOUND     r#2#2#3 
 LO BOUND     r#3#1#0              0
 PL BOUND     r#3#1#0 
 LO BOUND     r#3#1#1              0
 PL BOUND     r#3#1#1 
 LO BOUND     r#3#1#2              0
 PL BOUND     r#3#1#2 
 LO BOUND     r#3#1#3              0
 PL BOUND     r#3#1#3 
 LO BOUND     r#3#2#0              0
 PL BOUND     r#3#2#0 
 LO BOUND     r#3#2#1              0
 PL BOUND     r#3#2#1 
 LO BOUND     r#3#2#2              0
 PL BOUND     r#3#2#2 
 LO BOUND     r#3#2#3              0
 PL BOUND     r#3#2#3 
 LO BOUND     r#4#1#0              0
 PL BOUND     r#4#1#0 
 LO BOUND     r#4#1#1              0
 PL BOUND     r#4#1#1 
 LO BOUND     r#4#1#2              0
 PL BOUND     r#4#1#2 
 LO BOUND     r#4#1#3              0
 PL BOUND     r#4#1#3 
 LO BOUND     r#4#2#0              0
 PL BOUND     r#4#2#0 
 LO BOUND     r#4#2#1              0
 PL BOUND     r#4#2#1 
 LO BOUND     r#4#2#2              0
 PL BOUND     r#4#2#2 
 LO BOUND     r#4#2#3              0
 PL BOUND     r#4#2#3 
 LO BOUND     s#1#1#0              0
 PL BOUND     s#1#1#0 
 LO BOUND     s#1#1#1              0
 PL BOUND     s#1#1#1 
 LO BOUND     s#1#1#2              0
 PL BOUND     s#1#1#2 
 LO BOUND     s#1#1#3              0
 PL BOUND     s#1#1#3 
 LO BOUND     s#1#2#0              0
 PL BOUND     s#1#2#0 
 LO BOUND     s#1#2#1              0
 PL BOUND     s#1#2#1 
 LO BOUND     s#1#2#2              0
 PL BOUND     s#1#2#2 
 LO BOUND     s#1#2#3              0
 PL BOUND     s#1#2#3 
 LO BOUND     s#2#1#0              0
 PL BOUND     s#2#1#0 
 LO BOUND     s#2#1#1              0
 PL BOUND     s#2#1#1 
 LO BOUND     s#2#1#2              0
 PL BOUND     s#2#1#2 
 LO BOUND     s#2#1#3              0
 PL BOUND     s#2#1#3 
 LO BOUND     s#2#2#0              0
 PL BOUND     s#2#2#0 
 LO BOUND     s#2#2#1              0
 PL BOUND     s#2#2#1 
 LO BOUND     s#2#2#2              0
 PL BOUND     s#2#2#2 
 LO BOUND     s#2#2#3              0
 PL BOUND     s#2#2#3 
 LO BOUND     s#3#1#0              0
 PL BOUND     s#3#1#0 
 LO BOUND     s#3#1#1              0
 PL BOUND     s#3#1#1 
 LO BOUND     s#3#1#2              0
 PL BOUND     s#3#1#2 
 LO BOUND     s#3#1#3              0
 PL BOUND     s#3#1#3 
 LO BOUND     s#3#2#0              0
 PL BOUND     s#3#2#0 
 LO BOUND     s#3#2#1              0
 PL BOUND     s#3#2#1 
 LO BOUND     s#3#2#2              0
 PL BOUND     s#3#2#2 
 LO BOUND     s#3#2#3              0
 PL BOUND     s#3#2#3 
 LO BOUND     s#4#1#0              0
 PL BOUND     s#4#1#0 
 LO BOUND     s#4#1#1              0
 PL BOUND     s#4#1#1 
 LO BOUND     s#4#1#2              0
 PL BOUND     s#4#1#2 
 LO BOUND     s#4#1#3              0
 PL BOUND     s#4#1#3 
 LO BOUND     s#4#2#0              0
 PL BOUND     s#4#2#0 
 LO BOUND     s#4#2#1              0
 PL BOUND     s#4#2#1 
 LO BOUND     s#4#2#2              0
 PL BOUND     s#4#2#2 
 LO BOUND     s#4#2#3              0
 PL BOUND     s#4#2#3 
 LO BOUND     x#1#1#1              0
 PL BOUND     x#1#1#1 
 LO BOUND     x#1#1#2              0
 PL BOUND     x#1#1#2 
 LO BOUND     x#1#1#3              0
 PL BOUND     x#1#1#3 
 LO BOUND     x#1#2#1              0
 PL BOUND     x#1#2#1 
 LO BOUND     x#1#2#2              0
 PL BOUND     x#1#2#2 
 LO BOUND     x#1#2#3              0
 PL BOUND     x#1#2#3 
 LO BOUND     x#2#1#1              0
 PL BOUND     x#2#1#1 
 LO BOUND     x#2#1#2              0
 PL BOUND     x#2#1#2 
 LO BOUND     x#2#1#3              0
 PL BOUND     x#2#1#3 
 LO BOUND     x#2#2#1              0
 PL BOUND     x#2#2#1 
 LO BOUND     x#2#2#2              0
 PL BOUND     x#2#2#2 
 LO BOUND     x#2#2#3              0
 PL BOUND     x#2#2#3 
 LO BOUND     x#3#1#1              0
 PL BOUND     x#3#1#1 
 LO BOUND     x#3#1#2              0
 PL BOUND     x#3#1#2 
 LO BOUND     x#3#1#3              0
 PL BOUND     x#3#1#3 
 LO BOUND     x#3#2#1              0
 PL BOUND     x#3#2#1 
 LO BOUND     x#3#2#2              0
 PL BOUND     x#3#2#2 
 LO BOUND     x#3#2#3              0
 PL BOUND     x#3#2#3 
 LO BOUND     x#4#1#1              0
 PL BOUND     x#4#1#1 
 LO BOUND     x#4#1#2              0
 PL BOUND     x#4#1#2 
 LO BOUND     x#4#1#3              0
 PL BOUND     x#4#1#3 
 LO BOUND     x#4#2#1              0
 PL BOUND     x#4#2#1 
 LO BOUND     x#4#2#2              0
 PL BOUND     x#4#2#2 
 LO BOUND     x#4#2#3              0
 PL BOUND     x#4#2#3 
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
 LO BOUND     z#1                  0
 UP BOUND     z#1                  1
 LO BOUND     z#2                  0
 UP BOUND     z#2                  1
 LO BOUND     z#3                  0
 UP BOUND     z#3                  1
 LO BOUND     z#4                  0
 UP BOUND     z#4                  1
 LO BOUND     z#5                  0
 UP BOUND     z#5                  1
 LO BOUND     z#6                  0
 UP BOUND     z#6                  1
ENDATA
