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
 E  init1_1           
 E  init1_2           
 E  init1_3           
 E  init1_4           
 E  init1_5           
 E  init1_6           
 E  init2_1           
 E  init2_2           
 E  init2_3           
 E  init2_4           
 E  init2_5           
 E  init2_6           
 E  init3_1           
 E  init3_2           
 E  init3_3           
 E  init3_4           
 E  init3_5           
 E  init3_6           
COLUMNS
    MARK0000  'MARKER'                 'INTORG'
    x#1#1#1   valid_1             72
    x#1#1#1   balanc@1            72
    x#1#1#2   valid_1             72
    x#1#1#2   balanc@2            72
    x#1#1#3   valid_1             72
    x#1#1#3   balanc@3            72
    x#1#1#4   valid_1             72
    x#1#1#4   balanc@4            72
    x#1#2#1   balanc@5            72
    x#1#2#2   balanc@6            72
    x#1#2#3   balanc@7            72
    x#1#2#4   balanc@8            72
    x#2#1#1   valid_2             72
    x#2#1#1   balanc@9            72
    x#2#1#2   valid_2             72
    x#2#1#2   balanc@a            72
    x#2#1#3   valid_2             72
    x#2#1#3   balanc@b            72
    x#2#1#4   valid_2             72
    x#2#1#4   balanc@c            72
    x#2#2#1   valid_3             72
    x#2#2#1   balanc@d            72
    x#2#2#2   valid_3             72
    x#2#2#2   balanc@e            72
    x#2#2#3   valid_3             72
    x#2#2#3   balanc@f            72
    x#2#2#4   valid_3             72
    x#2#2#4   balan@10            72
    x#3#1#1   valid_4             72
    x#3#1#1   balan@11            72
    x#3#1#2   valid_4             72
    x#3#1#2   balan@12            72
    x#3#1#3   valid_4             72
    x#3#1#3   balan@13            72
    x#3#1#4   valid_4             72
    x#3#1#4   balan@14            72
    x#3#2#1   valid_5             72
    x#3#2#1   balan@15            72
    x#3#2#2   valid_5             72
    x#3#2#2   balan@16            72
    x#3#2#3   valid_5             72
    x#3#2#3   balan@17            72
    x#3#2#4   valid_5             72
    x#3#2#4   balan@18            72
    y#1#1#1   BigM_1               1
    y#1#1#1   valid_1             11
    y#1#1#1   balanc@5            61
    y#1#1#1   balanc@1            11
    y#1#1#2   BigM_2               1
    y#1#1#2   valid_1             11
    y#1#1#2   balanc@6            61
    y#1#1#2   balanc@2            11
    y#1#1#3   BigM_3               1
    y#1#1#3   valid_1             11
    y#1#1#3   balanc@7            61
    y#1#1#3   balanc@3            11
    y#1#1#4   BigM_4               1
    y#1#1#4   valid_1             11
    y#1#1#4   balanc@8            61
    y#1#1#4   balanc@4            11
    y#1#2#1   BigM_5               1
    y#1#2#1   valid_1             34
    y#1#2#1   balanc@5            38
    y#1#2#1   balanc@1            34
    y#1#2#2   BigM_6               1
    y#1#2#2   valid_1             34
    y#1#2#2   balanc@6            38
    y#1#2#2   balanc@2            34
    y#1#2#3   BigM_7               1
    y#1#2#3   valid_1             34
    y#1#2#3   balanc@7            38
    y#1#2#3   balanc@3            34
    y#1#2#4   BigM_8               1
    y#1#2#4   valid_1             34
    y#1#2#4   balanc@8            38
    y#1#2#4   balanc@4            34
    y#1#3#1   BigM_9               1
    y#1#3#1   valid_1             24
    y#1#3#1   balanc@5            48
    y#1#3#1   balanc@1            24
    y#1#3#2   BigM_10              1
    y#1#3#2   valid_1             24
    y#1#3#2   balanc@6            48
    y#1#3#2   balanc@2            24
    y#1#3#3   BigM_11              1
    y#1#3#3   valid_1             24
    y#1#3#3   balanc@7            48
    y#1#3#3   balanc@3            24
    y#1#3#4   BigM_12              1
    y#1#3#4   valid_1             24
    y#1#3#4   balanc@8            48
    y#1#3#4   balanc@4            24
    y#1#4#1   BigM_13              1
    y#1#4#1   valid_1             32
    y#1#4#1   balanc@5            40
    y#1#4#1   balanc@1            32
    y#1#4#2   BigM_14              1
    y#1#4#2   valid_1             32
    y#1#4#2   balanc@6            40
    y#1#4#2   balanc@2            32
    y#1#4#3   BigM_15              1
    y#1#4#3   valid_1             32
    y#1#4#3   balanc@7            40
    y#1#4#3   balanc@3            32
    y#1#4#4   BigM_16              1
    y#1#4#4   valid_1             32
    y#1#4#4   balanc@8            40
    y#1#4#4   balanc@4            32
    y#1#5#1   BigM_17              1
    y#1#5#1   valid_1             61
    y#1#5#1   balanc@5            11
    y#1#5#1   balanc@1            61
    y#1#5#2   BigM_18              1
    y#1#5#2   valid_1             61
    y#1#5#2   balanc@6            11
    y#1#5#2   balanc@2            61
    y#1#5#3   BigM_19              1
    y#1#5#3   valid_1             61
    y#1#5#3   balanc@7            11
    y#1#5#3   balanc@3            61
    y#1#5#4   BigM_20              1
    y#1#5#4   valid_1             61
    y#1#5#4   balanc@8            11
    y#1#5#4   balanc@4            61
    y#2#1#1   BigM_21              1
    y#2#1#1   valid_3             61
    y#2#1#1   valid_2             11
    y#2#1#1   balanc@d            61
    y#2#1#1   balanc@9            11
    y#2#1#2   BigM_22              1
    y#2#1#2   valid_3             61
    y#2#1#2   valid_2             11
    y#2#1#2   balanc@e            61
    y#2#1#2   balanc@a            11
    y#2#1#3   BigM_23              1
    y#2#1#3   valid_3             61
    y#2#1#3   valid_2             11
    y#2#1#3   balanc@f            61
    y#2#1#3   balanc@b            11
    y#2#1#4   BigM_24              1
    y#2#1#4   valid_3             61
    y#2#1#4   valid_2             11
    y#2#1#4   balan@10            61
    y#2#1#4   balanc@c            11
    y#2#2#1   BigM_25              1
    y#2#2#1   valid_3             38
    y#2#2#1   valid_2             34
    y#2#2#1   balanc@d            38
    y#2#2#1   balanc@9            34
    y#2#2#2   BigM_26              1
    y#2#2#2   valid_3             38
    y#2#2#2   valid_2             34
    y#2#2#2   balanc@e            38
    y#2#2#2   balanc@a            34
    y#2#2#3   BigM_27              1
    y#2#2#3   valid_3             38
    y#2#2#3   valid_2             34
    y#2#2#3   balanc@f            38
    y#2#2#3   balanc@b            34
    y#2#2#4   BigM_28              1
    y#2#2#4   valid_3             38
    y#2#2#4   valid_2             34
    y#2#2#4   balan@10            38
    y#2#2#4   balanc@c            34
    y#2#3#1   BigM_29              1
    y#2#3#1   valid_3             48
    y#2#3#1   valid_2             24
    y#2#3#1   balanc@d            48
    y#2#3#1   balanc@9            24
    y#2#3#2   BigM_30              1
    y#2#3#2   valid_3             48
    y#2#3#2   valid_2             24
    y#2#3#2   balanc@e            48
    y#2#3#2   balanc@a            24
    y#2#3#3   BigM_31              1
    y#2#3#3   valid_3             48
    y#2#3#3   valid_2             24
    y#2#3#3   balanc@f            48
    y#2#3#3   balanc@b            24
    y#2#3#4   BigM_32              1
    y#2#3#4   valid_3             48
    y#2#3#4   valid_2             24
    y#2#3#4   balan@10            48
    y#2#3#4   balanc@c            24
    y#2#4#1   BigM_33              1
    y#2#4#1   valid_3             40
    y#2#4#1   valid_2             32
    y#2#4#1   balanc@d            40
    y#2#4#1   balanc@9            32
    y#2#4#2   BigM_34              1
    y#2#4#2   valid_3             40
    y#2#4#2   valid_2             32
    y#2#4#2   balanc@e            40
    y#2#4#2   balanc@a            32
    y#2#4#3   BigM_35              1
    y#2#4#3   valid_3             40
    y#2#4#3   valid_2             32
    y#2#4#3   balanc@f            40
    y#2#4#3   balanc@b            32
    y#2#4#4   BigM_36              1
    y#2#4#4   valid_3             40
    y#2#4#4   valid_2             32
    y#2#4#4   balan@10            40
    y#2#4#4   balanc@c            32
    y#2#5#1   BigM_37              1
    y#2#5#1   valid_3             11
    y#2#5#1   valid_2             61
    y#2#5#1   balanc@d            11
    y#2#5#1   balanc@9            61
    y#2#5#2   BigM_38              1
    y#2#5#2   valid_3             11
    y#2#5#2   valid_2             61
    y#2#5#2   balanc@e            11
    y#2#5#2   balanc@a            61
    y#2#5#3   BigM_39              1
    y#2#5#3   valid_3             11
    y#2#5#3   valid_2             61
    y#2#5#3   balanc@f            11
    y#2#5#3   balanc@b            61
    y#2#5#4   BigM_40              1
    y#2#5#4   valid_3             11
    y#2#5#4   valid_2             61
    y#2#5#4   balan@10            11
    y#2#5#4   balanc@c            61
    y#3#1#1   BigM_41              1
    y#3#1#1   valid_5             61
    y#3#1#1   valid_4             11
    y#3#1#1   balan@15            61
    y#3#1#1   balan@11            11
    y#3#1#2   BigM_42              1
    y#3#1#2   valid_5             61
    y#3#1#2   valid_4             11
    y#3#1#2   balan@16            61
    y#3#1#2   balan@12            11
    y#3#1#3   BigM_43              1
    y#3#1#3   valid_5             61
    y#3#1#3   valid_4             11
    y#3#1#3   balan@17            61
    y#3#1#3   balan@13            11
    y#3#1#4   BigM_44              1
    y#3#1#4   valid_5             61
    y#3#1#4   valid_4             11
    y#3#1#4   balan@18            61
    y#3#1#4   balan@14            11
    y#3#2#1   BigM_45              1
    y#3#2#1   valid_5             38
    y#3#2#1   valid_4             34
    y#3#2#1   balan@15            38
    y#3#2#1   balan@11            34
    y#3#2#2   BigM_46              1
    y#3#2#2   valid_5             38
    y#3#2#2   valid_4             34
    y#3#2#2   balan@16            38
    y#3#2#2   balan@12            34
    y#3#2#3   BigM_47              1
    y#3#2#3   valid_5             38
    y#3#2#3   valid_4             34
    y#3#2#3   balan@17            38
    y#3#2#3   balan@13            34
    y#3#2#4   BigM_48              1
    y#3#2#4   valid_5             38
    y#3#2#4   valid_4             34
    y#3#2#4   balan@18            38
    y#3#2#4   balan@14            34
    y#3#3#1   BigM_49              1
    y#3#3#1   valid_5             48
    y#3#3#1   valid_4             24
    y#3#3#1   balan@15            48
    y#3#3#1   balan@11            24
    y#3#3#2   BigM_50              1
    y#3#3#2   valid_5             48
    y#3#3#2   valid_4             24
    y#3#3#2   balan@16            48
    y#3#3#2   balan@12            24
    y#3#3#3   BigM_51              1
    y#3#3#3   valid_5             48
    y#3#3#3   valid_4             24
    y#3#3#3   balan@17            48
    y#3#3#3   balan@13            24
    y#3#3#4   BigM_52              1
    y#3#3#4   valid_5             48
    y#3#3#4   valid_4             24
    y#3#3#4   balan@18            48
    y#3#3#4   balan@14            24
    y#3#4#1   BigM_53              1
    y#3#4#1   valid_5             40
    y#3#4#1   valid_4             32
    y#3#4#1   balan@15            40
    y#3#4#1   balan@11            32
    y#3#4#2   BigM_54              1
    y#3#4#2   valid_5             40
    y#3#4#2   valid_4             32
    y#3#4#2   balan@16            40
    y#3#4#2   balan@12            32
    y#3#4#3   BigM_55              1
    y#3#4#3   valid_5             40
    y#3#4#3   valid_4             32
    y#3#4#3   balan@17            40
    y#3#4#3   balan@13            32
    y#3#4#4   BigM_56              1
    y#3#4#4   valid_5             40
    y#3#4#4   valid_4             32
    y#3#4#4   balan@18            40
    y#3#4#4   balan@14            32
    y#3#5#1   BigM_57              1
    y#3#5#1   valid_5             11
    y#3#5#1   valid_4             61
    y#3#5#1   balan@15            11
    y#3#5#1   balan@11            61
    y#3#5#2   BigM_58              1
    y#3#5#2   valid_5             11
    y#3#5#2   valid_4             61
    y#3#5#2   balan@16            11
    y#3#5#2   balan@12            61
    y#3#5#3   BigM_59              1
    y#3#5#3   valid_5             11
    y#3#5#3   valid_4             61
    y#3#5#3   balan@17            11
    y#3#5#3   balan@13            61
    y#3#5#4   BigM_60              1
    y#3#5#4   valid_5             11
    y#3#5#4   valid_4             61
    y#3#5#4   balan@18            11
    y#3#5#4   balan@14            61
    z#1       BigM_44            -93
    z#1       BigM_43            -93
    z#1       BigM_42            -93
    z#1       BigM_41            -93
    z#1       BigM_24           -213
    z#1       BigM_23           -213
    z#1       BigM_22           -213
    z#1       BigM_21           -213
    z#1       BigM_4            -181
    z#1       BigM_3            -181
    z#1       BigM_2            -181
    z#1       BigM_1            -181
    z#1       select_1             1
    z#2       BigM_48            -42
    z#2       BigM_47            -42
    z#2       BigM_46            -42
    z#2       BigM_45            -42
    z#2       BigM_28            -69
    z#2       BigM_27            -69
    z#2       BigM_26            -69
    z#2       BigM_25            -69
    z#2       BigM_8             -59
    z#2       BigM_7             -59
    z#2       BigM_6             -59
    z#2       BigM_5             -59
    z#2       select_1             1
    z#3       BigM_52            -43
    z#3       BigM_51            -43
    z#3       BigM_50            -43
    z#3       BigM_49            -43
    z#3       BigM_32            -98
    z#3       BigM_31            -98
    z#3       BigM_30            -98
    z#3       BigM_29            -98
    z#3       BigM_12            -83
    z#3       BigM_11            -83
    z#3       BigM_10            -83
    z#3       BigM_9             -83
    z#3       select_1             1
    z#4       BigM_56            -40
    z#4       BigM_55            -40
    z#4       BigM_54            -40
    z#4       BigM_53            -40
    z#4       BigM_36            -74
    z#4       BigM_35            -74
    z#4       BigM_34            -74
    z#4       BigM_33            -74
    z#4       BigM_16            -63
    z#4       BigM_15            -63
    z#4       BigM_14            -63
    z#4       BigM_13            -63
    z#4       select_1             1
    z#5       BigM_60           -145
    z#5       BigM_59           -145
    z#5       BigM_58           -145
    z#5       BigM_57           -145
    z#5       BigM_40           -122
    z#5       BigM_39           -122
    z#5       BigM_38           -122
    z#5       BigM_37           -122
    z#5       BigM_20            -33
    z#5       BigM_19            -33
    z#5       BigM_18            -33
    z#5       BigM_17            -33
    z#5       select_1             1
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
    r#1#1#3   balanc@4            -1
    r#1#1#3   balanc@3             1
    r#1#1#4   OBJECTIV             5
    r#1#1#4   init3_1              1
    r#1#1#4   balanc@4             1
    r#1#2#0   init2_2              1
    r#1#2#0   balanc@5            -1
    r#1#2#1   OBJECTIV           5.5
    r#1#2#1   balanc@6            -1
    r#1#2#1   balanc@5             1
    r#1#2#2   OBJECTIV           5.5
    r#1#2#2   balanc@7            -1
    r#1#2#2   balanc@6             1
    r#1#2#3   OBJECTIV           5.5
    r#1#2#3   balanc@8            -1
    r#1#2#3   balanc@7             1
    r#1#2#4   OBJECTIV           5.5
    r#1#2#4   init3_2              1
    r#1#2#4   balanc@8             1
    r#2#1#0   init2_3              1
    r#2#1#0   balanc@9            -1
    r#2#1#1   OBJECTIV             5
    r#2#1#1   balanc@a            -1
    r#2#1#1   balanc@9             1
    r#2#1#2   OBJECTIV             5
    r#2#1#2   balanc@b            -1
    r#2#1#2   balanc@a             1
    r#2#1#3   OBJECTIV             5
    r#2#1#3   balanc@c            -1
    r#2#1#3   balanc@b             1
    r#2#1#4   OBJECTIV             5
    r#2#1#4   init3_3              1
    r#2#1#4   balanc@c             1
    r#2#2#0   init2_4              1
    r#2#2#0   balanc@d            -1
    r#2#2#1   OBJECTIV           5.5
    r#2#2#1   balanc@e            -1
    r#2#2#1   balanc@d             1
    r#2#2#2   OBJECTIV           5.5
    r#2#2#2   balanc@f            -1
    r#2#2#2   balanc@e             1
    r#2#2#3   OBJECTIV           5.5
    r#2#2#3   balan@10            -1
    r#2#2#3   balanc@f             1
    r#2#2#4   OBJECTIV           5.5
    r#2#2#4   init3_4              1
    r#2#2#4   balan@10             1
    r#3#1#0   init2_5              1
    r#3#1#0   balan@11            -1
    r#3#1#1   OBJECTIV             5
    r#3#1#1   balan@12            -1
    r#3#1#1   balan@11             1
    r#3#1#2   OBJECTIV             5
    r#3#1#2   balan@13            -1
    r#3#1#2   balan@12             1
    r#3#1#3   OBJECTIV             5
    r#3#1#3   balan@14            -1
    r#3#1#3   balan@13             1
    r#3#1#4   OBJECTIV             5
    r#3#1#4   init3_5              1
    r#3#1#4   balan@14             1
    r#3#2#0   init2_6              1
    r#3#2#0   balan@15            -1
    r#3#2#1   OBJECTIV           5.5
    r#3#2#1   balan@16            -1
    r#3#2#1   balan@15             1
    r#3#2#2   OBJECTIV           5.5
    r#3#2#2   balan@17            -1
    r#3#2#2   balan@16             1
    r#3#2#3   OBJECTIV           5.5
    r#3#2#3   balan@18            -1
    r#3#2#3   balan@17             1
    r#3#2#4   OBJECTIV           5.5
    r#3#2#4   init3_6              1
    r#3#2#4   balan@18             1
    s#1#1#0   init1_1              1
    s#1#1#0   balanc@1             1
    s#1#1#1   OBJECTIV             1
    s#1#1#1   balanc@2             1
    s#1#1#1   balanc@1            -1
    s#1#1#2   OBJECTIV             1
    s#1#1#2   balanc@3             1
    s#1#1#2   balanc@2            -1
    s#1#1#3   OBJECTIV             1
    s#1#1#3   balanc@4             1
    s#1#1#3   balanc@3            -1
    s#1#1#4   OBJECTIV             1
    s#1#1#4   balanc@4            -1
    s#1#2#0   init1_2              1
    s#1#2#0   balanc@5             1
    s#1#2#1   OBJECTIV           1.1
    s#1#2#1   balanc@6             1
    s#1#2#1   balanc@5            -1
    s#1#2#2   OBJECTIV           1.1
    s#1#2#2   balanc@7             1
    s#1#2#2   balanc@6            -1
    s#1#2#3   OBJECTIV           1.1
    s#1#2#3   balanc@8             1
    s#1#2#3   balanc@7            -1
    s#1#2#4   OBJECTIV           1.1
    s#1#2#4   balanc@8            -1
    s#2#1#0   init1_3              1
    s#2#1#0   balanc@9             1
    s#2#1#1   OBJECTIV             1
    s#2#1#1   balanc@a             1
    s#2#1#1   balanc@9            -1
    s#2#1#2   OBJECTIV             1
    s#2#1#2   balanc@b             1
    s#2#1#2   balanc@a            -1
    s#2#1#3   OBJECTIV             1
    s#2#1#3   balanc@c             1
    s#2#1#3   balanc@b            -1
    s#2#1#4   OBJECTIV             1
    s#2#1#4   balanc@c            -1
    s#2#2#0   init1_4              1
    s#2#2#0   balanc@d             1
    s#2#2#1   OBJECTIV           1.1
    s#2#2#1   balanc@e             1
    s#2#2#1   balanc@d            -1
    s#2#2#2   OBJECTIV           1.1
    s#2#2#2   balanc@f             1
    s#2#2#2   balanc@e            -1
    s#2#2#3   OBJECTIV           1.1
    s#2#2#3   balan@10             1
    s#2#2#3   balanc@f            -1
    s#2#2#4   OBJECTIV           1.1
    s#2#2#4   balan@10            -1
    s#3#1#0   init1_5              1
    s#3#1#0   balan@11             1
    s#3#1#1   OBJECTIV             1
    s#3#1#1   balan@12             1
    s#3#1#1   balan@11            -1
    s#3#1#2   OBJECTIV             1
    s#3#1#2   balan@13             1
    s#3#1#2   balan@12            -1
    s#3#1#3   OBJECTIV             1
    s#3#1#3   balan@14             1
    s#3#1#3   balan@13            -1
    s#3#1#4   OBJECTIV             1
    s#3#1#4   balan@14            -1
    s#3#2#0   init1_6              1
    s#3#2#0   balan@15             1
    s#3#2#1   OBJECTIV           1.1
    s#3#2#1   balan@16             1
    s#3#2#1   balan@15            -1
    s#3#2#2   OBJECTIV           1.1
    s#3#2#2   balan@17             1
    s#3#2#2   balan@16            -1
    s#3#2#3   OBJECTIV           1.1
    s#3#2#3   balan@18             1
    s#3#2#3   balan@17            -1
    s#3#2#4   OBJECTIV           1.1
    s#3#2#4   balan@18            -1
RHS
    RHS       select_1             1
    RHS       balanc@1           964
    RHS       balanc@2            21
    RHS       balanc@3           337
    RHS       balanc@4           669
    RHS       balanc@9           333
    RHS       balanc@a           776
    RHS       balanc@b           466
    RHS       balanc@c           764
    RHS       balanc@d           239
    RHS       balanc@e           425
    RHS       balanc@f           220
    RHS       balan@10           452
    RHS       balan@11           136
    RHS       balan@12           621
    RHS       balan@13           192
    RHS       balan@14            74
    RHS       balan@15             7
    RHS       balan@16            27
    RHS       balan@17           934
    RHS       balan@18           620
    RHS       valid_1           1991
    RHS       valid_2           2339
    RHS       valid_3           1336
    RHS       valid_4           1023
    RHS       valid_5           1588
BOUNDS
 LO BOUND     r#1#1#0              0
 PL BOUND     r#1#1#0 
 LO BOUND     r#1#1#1              0
 PL BOUND     r#1#1#1 
 LO BOUND     r#1#1#2              0
 PL BOUND     r#1#1#2 
 LO BOUND     r#1#1#3              0
 PL BOUND     r#1#1#3 
 LO BOUND     r#1#1#4              0
 PL BOUND     r#1#1#4 
 LO BOUND     r#1#2#0              0
 PL BOUND     r#1#2#0 
 LO BOUND     r#1#2#1              0
 PL BOUND     r#1#2#1 
 LO BOUND     r#1#2#2              0
 PL BOUND     r#1#2#2 
 LO BOUND     r#1#2#3              0
 PL BOUND     r#1#2#3 
 LO BOUND     r#1#2#4              0
 PL BOUND     r#1#2#4 
 LO BOUND     r#2#1#0              0
 PL BOUND     r#2#1#0 
 LO BOUND     r#2#1#1              0
 PL BOUND     r#2#1#1 
 LO BOUND     r#2#1#2              0
 PL BOUND     r#2#1#2 
 LO BOUND     r#2#1#3              0
 PL BOUND     r#2#1#3 
 LO BOUND     r#2#1#4              0
 PL BOUND     r#2#1#4 
 LO BOUND     r#2#2#0              0
 PL BOUND     r#2#2#0 
 LO BOUND     r#2#2#1              0
 PL BOUND     r#2#2#1 
 LO BOUND     r#2#2#2              0
 PL BOUND     r#2#2#2 
 LO BOUND     r#2#2#3              0
 PL BOUND     r#2#2#3 
 LO BOUND     r#2#2#4              0
 PL BOUND     r#2#2#4 
 LO BOUND     r#3#1#0              0
 PL BOUND     r#3#1#0 
 LO BOUND     r#3#1#1              0
 PL BOUND     r#3#1#1 
 LO BOUND     r#3#1#2              0
 PL BOUND     r#3#1#2 
 LO BOUND     r#3#1#3              0
 PL BOUND     r#3#1#3 
 LO BOUND     r#3#1#4              0
 PL BOUND     r#3#1#4 
 LO BOUND     r#3#2#0              0
 PL BOUND     r#3#2#0 
 LO BOUND     r#3#2#1              0
 PL BOUND     r#3#2#1 
 LO BOUND     r#3#2#2              0
 PL BOUND     r#3#2#2 
 LO BOUND     r#3#2#3              0
 PL BOUND     r#3#2#3 
 LO BOUND     r#3#2#4              0
 PL BOUND     r#3#2#4 
 LO BOUND     s#1#1#0              0
 PL BOUND     s#1#1#0 
 LO BOUND     s#1#1#1              0
 PL BOUND     s#1#1#1 
 LO BOUND     s#1#1#2              0
 PL BOUND     s#1#1#2 
 LO BOUND     s#1#1#3              0
 PL BOUND     s#1#1#3 
 LO BOUND     s#1#1#4              0
 PL BOUND     s#1#1#4 
 LO BOUND     s#1#2#0              0
 PL BOUND     s#1#2#0 
 LO BOUND     s#1#2#1              0
 PL BOUND     s#1#2#1 
 LO BOUND     s#1#2#2              0
 PL BOUND     s#1#2#2 
 LO BOUND     s#1#2#3              0
 PL BOUND     s#1#2#3 
 LO BOUND     s#1#2#4              0
 PL BOUND     s#1#2#4 
 LO BOUND     s#2#1#0              0
 PL BOUND     s#2#1#0 
 LO BOUND     s#2#1#1              0
 PL BOUND     s#2#1#1 
 LO BOUND     s#2#1#2              0
 PL BOUND     s#2#1#2 
 LO BOUND     s#2#1#3              0
 PL BOUND     s#2#1#3 
 LO BOUND     s#2#1#4              0
 PL BOUND     s#2#1#4 
 LO BOUND     s#2#2#0              0
 PL BOUND     s#2#2#0 
 LO BOUND     s#2#2#1              0
 PL BOUND     s#2#2#1 
 LO BOUND     s#2#2#2              0
 PL BOUND     s#2#2#2 
 LO BOUND     s#2#2#3              0
 PL BOUND     s#2#2#3 
 LO BOUND     s#2#2#4              0
 PL BOUND     s#2#2#4 
 LO BOUND     s#3#1#0              0
 PL BOUND     s#3#1#0 
 LO BOUND     s#3#1#1              0
 PL BOUND     s#3#1#1 
 LO BOUND     s#3#1#2              0
 PL BOUND     s#3#1#2 
 LO BOUND     s#3#1#3              0
 PL BOUND     s#3#1#3 
 LO BOUND     s#3#1#4              0
 PL BOUND     s#3#1#4 
 LO BOUND     s#3#2#0              0
 PL BOUND     s#3#2#0 
 LO BOUND     s#3#2#1              0
 PL BOUND     s#3#2#1 
 LO BOUND     s#3#2#2              0
 PL BOUND     s#3#2#2 
 LO BOUND     s#3#2#3              0
 PL BOUND     s#3#2#3 
 LO BOUND     s#3#2#4              0
 PL BOUND     s#3#2#4 
 LO BOUND     x#1#1#1              0
 PL BOUND     x#1#1#1 
 LO BOUND     x#1#1#2              0
 PL BOUND     x#1#1#2 
 LO BOUND     x#1#1#3              0
 PL BOUND     x#1#1#3 
 LO BOUND     x#1#1#4              0
 PL BOUND     x#1#1#4 
 LO BOUND     x#1#2#1              0
 PL BOUND     x#1#2#1 
 LO BOUND     x#1#2#2              0
 PL BOUND     x#1#2#2 
 LO BOUND     x#1#2#3              0
 PL BOUND     x#1#2#3 
 LO BOUND     x#1#2#4              0
 PL BOUND     x#1#2#4 
 LO BOUND     x#2#1#1              0
 PL BOUND     x#2#1#1 
 LO BOUND     x#2#1#2              0
 PL BOUND     x#2#1#2 
 LO BOUND     x#2#1#3              0
 PL BOUND     x#2#1#3 
 LO BOUND     x#2#1#4              0
 PL BOUND     x#2#1#4 
 LO BOUND     x#2#2#1              0
 PL BOUND     x#2#2#1 
 LO BOUND     x#2#2#2              0
 PL BOUND     x#2#2#2 
 LO BOUND     x#2#2#3              0
 PL BOUND     x#2#2#3 
 LO BOUND     x#2#2#4              0
 PL BOUND     x#2#2#4 
 LO BOUND     x#3#1#1              0
 PL BOUND     x#3#1#1 
 LO BOUND     x#3#1#2              0
 PL BOUND     x#3#1#2 
 LO BOUND     x#3#1#3              0
 PL BOUND     x#3#1#3 
 LO BOUND     x#3#1#4              0
 PL BOUND     x#3#1#4 
 LO BOUND     x#3#2#1              0
 PL BOUND     x#3#2#1 
 LO BOUND     x#3#2#2              0
 PL BOUND     x#3#2#2 
 LO BOUND     x#3#2#3              0
 PL BOUND     x#3#2#3 
 LO BOUND     x#3#2#4              0
 PL BOUND     x#3#2#4 
 LO BOUND     y#1#1#1              0
 PL BOUND     y#1#1#1 
 LO BOUND     y#1#1#2              0
 PL BOUND     y#1#1#2 
 LO BOUND     y#1#1#3              0
 PL BOUND     y#1#1#3 
 LO BOUND     y#1#1#4              0
 PL BOUND     y#1#1#4 
 LO BOUND     y#1#2#1              0
 PL BOUND     y#1#2#1 
 LO BOUND     y#1#2#2              0
 PL BOUND     y#1#2#2 
 LO BOUND     y#1#2#3              0
 PL BOUND     y#1#2#3 
 LO BOUND     y#1#2#4              0
 PL BOUND     y#1#2#4 
 LO BOUND     y#1#3#1              0
 PL BOUND     y#1#3#1 
 LO BOUND     y#1#3#2              0
 PL BOUND     y#1#3#2 
 LO BOUND     y#1#3#3              0
 PL BOUND     y#1#3#3 
 LO BOUND     y#1#3#4              0
 PL BOUND     y#1#3#4 
 LO BOUND     y#1#4#1              0
 PL BOUND     y#1#4#1 
 LO BOUND     y#1#4#2              0
 PL BOUND     y#1#4#2 
 LO BOUND     y#1#4#3              0
 PL BOUND     y#1#4#3 
 LO BOUND     y#1#4#4              0
 PL BOUND     y#1#4#4 
 LO BOUND     y#1#5#1              0
 PL BOUND     y#1#5#1 
 LO BOUND     y#1#5#2              0
 PL BOUND     y#1#5#2 
 LO BOUND     y#1#5#3              0
 PL BOUND     y#1#5#3 
 LO BOUND     y#1#5#4              0
 PL BOUND     y#1#5#4 
 LO BOUND     y#2#1#1              0
 PL BOUND     y#2#1#1 
 LO BOUND     y#2#1#2              0
 PL BOUND     y#2#1#2 
 LO BOUND     y#2#1#3              0
 PL BOUND     y#2#1#3 
 LO BOUND     y#2#1#4              0
 PL BOUND     y#2#1#4 
 LO BOUND     y#2#2#1              0
 PL BOUND     y#2#2#1 
 LO BOUND     y#2#2#2              0
 PL BOUND     y#2#2#2 
 LO BOUND     y#2#2#3              0
 PL BOUND     y#2#2#3 
 LO BOUND     y#2#2#4              0
 PL BOUND     y#2#2#4 
 LO BOUND     y#2#3#1              0
 PL BOUND     y#2#3#1 
 LO BOUND     y#2#3#2              0
 PL BOUND     y#2#3#2 
 LO BOUND     y#2#3#3              0
 PL BOUND     y#2#3#3 
 LO BOUND     y#2#3#4              0
 PL BOUND     y#2#3#4 
 LO BOUND     y#2#4#1              0
 PL BOUND     y#2#4#1 
 LO BOUND     y#2#4#2              0
 PL BOUND     y#2#4#2 
 LO BOUND     y#2#4#3              0
 PL BOUND     y#2#4#3 
 LO BOUND     y#2#4#4              0
 PL BOUND     y#2#4#4 
 LO BOUND     y#2#5#1              0
 PL BOUND     y#2#5#1 
 LO BOUND     y#2#5#2              0
 PL BOUND     y#2#5#2 
 LO BOUND     y#2#5#3              0
 PL BOUND     y#2#5#3 
 LO BOUND     y#2#5#4              0
 PL BOUND     y#2#5#4 
 LO BOUND     y#3#1#1              0
 PL BOUND     y#3#1#1 
 LO BOUND     y#3#1#2              0
 PL BOUND     y#3#1#2 
 LO BOUND     y#3#1#3              0
 PL BOUND     y#3#1#3 
 LO BOUND     y#3#1#4              0
 PL BOUND     y#3#1#4 
 LO BOUND     y#3#2#1              0
 PL BOUND     y#3#2#1 
 LO BOUND     y#3#2#2              0
 PL BOUND     y#3#2#2 
 LO BOUND     y#3#2#3              0
 PL BOUND     y#3#2#3 
 LO BOUND     y#3#2#4              0
 PL BOUND     y#3#2#4 
 LO BOUND     y#3#3#1              0
 PL BOUND     y#3#3#1 
 LO BOUND     y#3#3#2              0
 PL BOUND     y#3#3#2 
 LO BOUND     y#3#3#3              0
 PL BOUND     y#3#3#3 
 LO BOUND     y#3#3#4              0
 PL BOUND     y#3#3#4 
 LO BOUND     y#3#4#1              0
 PL BOUND     y#3#4#1 
 LO BOUND     y#3#4#2              0
 PL BOUND     y#3#4#2 
 LO BOUND     y#3#4#3              0
 PL BOUND     y#3#4#3 
 LO BOUND     y#3#4#4              0
 PL BOUND     y#3#4#4 
 LO BOUND     y#3#5#1              0
 PL BOUND     y#3#5#1 
 LO BOUND     y#3#5#2              0
 PL BOUND     y#3#5#2 
 LO BOUND     y#3#5#3              0
 PL BOUND     y#3#5#3 
 LO BOUND     y#3#5#4              0
 PL BOUND     y#3#5#4 
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
ENDATA
