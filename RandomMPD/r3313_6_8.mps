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
 E  balan@19          
 E  balan@1a          
 E  balan@1b          
 G  valid_1           
 G  valid_2           
 G  valid_3           
 G  valid_4           
 G  valid_5           
 G  valid_6           
 G  valid_7           
 G  valid_8           
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
 E  init1_1           
 E  init1_2           
 E  init1_3           
 E  init1_4           
 E  init1_5           
 E  init1_6           
 E  init1_7           
 E  init1_8           
 E  init1_9           
 E  init2_1           
 E  init2_2           
 E  init2_3           
 E  init2_4           
 E  init2_5           
 E  init2_6           
 E  init2_7           
 E  init2_8           
 E  init2_9           
 E  init3_1           
 E  init3_2           
 E  init3_3           
 E  init3_4           
 E  init3_5           
 E  init3_6           
 E  init3_7           
 E  init3_8           
 E  init3_9           
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
    x#1#3#1   valid_2             72
    x#1#3#1   balanc@7            72
    x#1#3#2   valid_2             72
    x#1#3#2   balanc@8            72
    x#1#3#3   valid_2             72
    x#1#3#3   balanc@9            72
    x#2#1#1   valid_3             72
    x#2#1#1   balanc@a            72
    x#2#1#2   valid_3             72
    x#2#1#2   balanc@b            72
    x#2#1#3   valid_3             72
    x#2#1#3   balanc@c            72
    x#2#2#1   valid_4             72
    x#2#2#1   balanc@d            72
    x#2#2#2   valid_4             72
    x#2#2#2   balanc@e            72
    x#2#2#3   valid_4             72
    x#2#2#3   balanc@f            72
    x#2#3#1   valid_5             72
    x#2#3#1   balan@10            72
    x#2#3#2   valid_5             72
    x#2#3#2   balan@11            72
    x#2#3#3   valid_5             72
    x#2#3#3   balan@12            72
    x#3#1#1   valid_6             72
    x#3#1#1   balan@13            72
    x#3#1#2   valid_6             72
    x#3#1#2   balan@14            72
    x#3#1#3   valid_6             72
    x#3#1#3   balan@15            72
    x#3#2#1   valid_7             72
    x#3#2#1   balan@16            72
    x#3#2#2   valid_7             72
    x#3#2#2   balan@17            72
    x#3#2#3   valid_7             72
    x#3#2#3   balan@18            72
    x#3#3#1   valid_8             72
    x#3#3#1   balan@19            72
    x#3#3#2   valid_8             72
    x#3#3#2   balan@1a            72
    x#3#3#3   valid_8             72
    x#3#3#3   balan@1b            72
    y#1#1#1   BigM_1               1
    y#1#1#1   valid_2             26
    y#1#1#1   valid_1             42
    y#1#1#1   balanc@7            26
    y#1#1#1   balanc@4             4
    y#1#1#1   balanc@1            42
    y#1#1#2   BigM_2               1
    y#1#1#2   valid_2             26
    y#1#1#2   valid_1             42
    y#1#1#2   balanc@8            26
    y#1#1#2   balanc@5             4
    y#1#1#2   balanc@2            42
    y#1#1#3   BigM_3               1
    y#1#1#3   valid_2             26
    y#1#1#3   valid_1             42
    y#1#1#3   balanc@9            26
    y#1#1#3   balanc@6             4
    y#1#1#3   balanc@3            42
    y#1#2#1   BigM_4               1
    y#1#2#1   valid_2             16
    y#1#2#1   valid_1             33
    y#1#2#1   balanc@7            16
    y#1#2#1   balanc@4            23
    y#1#2#1   balanc@1            33
    y#1#2#2   BigM_5               1
    y#1#2#2   valid_2             16
    y#1#2#2   valid_1             33
    y#1#2#2   balanc@8            16
    y#1#2#2   balanc@5            23
    y#1#2#2   balanc@2            33
    y#1#2#3   BigM_6               1
    y#1#2#3   valid_2             16
    y#1#2#3   valid_1             33
    y#1#2#3   balanc@9            16
    y#1#2#3   balanc@6            23
    y#1#2#3   balanc@3            33
    y#1#3#1   BigM_7               1
    y#1#3#1   valid_2             16
    y#1#3#1   valid_1             41
    y#1#3#1   balanc@7            16
    y#1#3#1   balanc@4            15
    y#1#3#1   balanc@1            41
    y#1#3#2   BigM_8               1
    y#1#3#2   valid_2             16
    y#1#3#2   valid_1             41
    y#1#3#2   balanc@8            16
    y#1#3#2   balanc@5            15
    y#1#3#2   balanc@2            41
    y#1#3#3   BigM_9               1
    y#1#3#3   valid_2             16
    y#1#3#3   valid_1             41
    y#1#3#3   balanc@9            16
    y#1#3#3   balanc@6            15
    y#1#3#3   balanc@3            41
    y#1#4#1   BigM_10              1
    y#1#4#1   valid_2              9
    y#1#4#1   valid_1             15
    y#1#4#1   balanc@7             9
    y#1#4#1   balanc@4            48
    y#1#4#1   balanc@1            15
    y#1#4#2   BigM_11              1
    y#1#4#2   valid_2              9
    y#1#4#2   valid_1             15
    y#1#4#2   balanc@8             9
    y#1#4#2   balanc@5            48
    y#1#4#2   balanc@2            15
    y#1#4#3   BigM_12              1
    y#1#4#3   valid_2              9
    y#1#4#3   valid_1             15
    y#1#4#3   balanc@9             9
    y#1#4#3   balanc@6            48
    y#1#4#3   balanc@3            15
    y#1#5#1   BigM_13              1
    y#1#5#1   valid_2              1
    y#1#5#1   valid_1             27
    y#1#5#1   balanc@7             1
    y#1#5#1   balanc@4            44
    y#1#5#1   balanc@1            27
    y#1#5#2   BigM_14              1
    y#1#5#2   valid_2              1
    y#1#5#2   valid_1             27
    y#1#5#2   balanc@8             1
    y#1#5#2   balanc@5            44
    y#1#5#2   balanc@2            27
    y#1#5#3   BigM_15              1
    y#1#5#3   valid_2              1
    y#1#5#3   valid_1             27
    y#1#5#3   balanc@9             1
    y#1#5#3   balanc@6            44
    y#1#5#3   balanc@3            27
    y#1#6#1   BigM_16              1
    y#1#6#1   valid_2              6
    y#1#6#1   valid_1             35
    y#1#6#1   balanc@7             6
    y#1#6#1   balanc@4            31
    y#1#6#1   balanc@1            35
    y#1#6#2   BigM_17              1
    y#1#6#2   valid_2              6
    y#1#6#2   valid_1             35
    y#1#6#2   balanc@8             6
    y#1#6#2   balanc@5            31
    y#1#6#2   balanc@2            35
    y#1#6#3   BigM_18              1
    y#1#6#3   valid_2              6
    y#1#6#3   valid_1             35
    y#1#6#3   balanc@9             6
    y#1#6#3   balanc@6            31
    y#1#6#3   balanc@3            35
    y#2#1#1   BigM_19              1
    y#2#1#1   valid_5             26
    y#2#1#1   valid_4              4
    y#2#1#1   valid_3             42
    y#2#1#1   balan@10            26
    y#2#1#1   balanc@d             4
    y#2#1#1   balanc@a            42
    y#2#1#2   BigM_20              1
    y#2#1#2   valid_5             26
    y#2#1#2   valid_4              4
    y#2#1#2   valid_3             42
    y#2#1#2   balan@11            26
    y#2#1#2   balanc@e             4
    y#2#1#2   balanc@b            42
    y#2#1#3   BigM_21              1
    y#2#1#3   valid_5             26
    y#2#1#3   valid_4              4
    y#2#1#3   valid_3             42
    y#2#1#3   balan@12            26
    y#2#1#3   balanc@f             4
    y#2#1#3   balanc@c            42
    y#2#2#1   BigM_22              1
    y#2#2#1   valid_5             16
    y#2#2#1   valid_4             23
    y#2#2#1   valid_3             33
    y#2#2#1   balan@10            16
    y#2#2#1   balanc@d            23
    y#2#2#1   balanc@a            33
    y#2#2#2   BigM_23              1
    y#2#2#2   valid_5             16
    y#2#2#2   valid_4             23
    y#2#2#2   valid_3             33
    y#2#2#2   balan@11            16
    y#2#2#2   balanc@e            23
    y#2#2#2   balanc@b            33
    y#2#2#3   BigM_24              1
    y#2#2#3   valid_5             16
    y#2#2#3   valid_4             23
    y#2#2#3   valid_3             33
    y#2#2#3   balan@12            16
    y#2#2#3   balanc@f            23
    y#2#2#3   balanc@c            33
    y#2#3#1   BigM_25              1
    y#2#3#1   valid_5             16
    y#2#3#1   valid_4             15
    y#2#3#1   valid_3             41
    y#2#3#1   balan@10            16
    y#2#3#1   balanc@d            15
    y#2#3#1   balanc@a            41
    y#2#3#2   BigM_26              1
    y#2#3#2   valid_5             16
    y#2#3#2   valid_4             15
    y#2#3#2   valid_3             41
    y#2#3#2   balan@11            16
    y#2#3#2   balanc@e            15
    y#2#3#2   balanc@b            41
    y#2#3#3   BigM_27              1
    y#2#3#3   valid_5             16
    y#2#3#3   valid_4             15
    y#2#3#3   valid_3             41
    y#2#3#3   balan@12            16
    y#2#3#3   balanc@f            15
    y#2#3#3   balanc@c            41
    y#2#4#1   BigM_28              1
    y#2#4#1   valid_5              9
    y#2#4#1   valid_4             48
    y#2#4#1   valid_3             15
    y#2#4#1   balan@10             9
    y#2#4#1   balanc@d            48
    y#2#4#1   balanc@a            15
    y#2#4#2   BigM_29              1
    y#2#4#2   valid_5              9
    y#2#4#2   valid_4             48
    y#2#4#2   valid_3             15
    y#2#4#2   balan@11             9
    y#2#4#2   balanc@e            48
    y#2#4#2   balanc@b            15
    y#2#4#3   BigM_30              1
    y#2#4#3   valid_5              9
    y#2#4#3   valid_4             48
    y#2#4#3   valid_3             15
    y#2#4#3   balan@12             9
    y#2#4#3   balanc@f            48
    y#2#4#3   balanc@c            15
    y#2#5#1   BigM_31              1
    y#2#5#1   valid_5              1
    y#2#5#1   valid_4             44
    y#2#5#1   valid_3             27
    y#2#5#1   balan@10             1
    y#2#5#1   balanc@d            44
    y#2#5#1   balanc@a            27
    y#2#5#2   BigM_32              1
    y#2#5#2   valid_5              1
    y#2#5#2   valid_4             44
    y#2#5#2   valid_3             27
    y#2#5#2   balan@11             1
    y#2#5#2   balanc@e            44
    y#2#5#2   balanc@b            27
    y#2#5#3   BigM_33              1
    y#2#5#3   valid_5              1
    y#2#5#3   valid_4             44
    y#2#5#3   valid_3             27
    y#2#5#3   balan@12             1
    y#2#5#3   balanc@f            44
    y#2#5#3   balanc@c            27
    y#2#6#1   BigM_34              1
    y#2#6#1   valid_5              6
    y#2#6#1   valid_4             31
    y#2#6#1   valid_3             35
    y#2#6#1   balan@10             6
    y#2#6#1   balanc@d            31
    y#2#6#1   balanc@a            35
    y#2#6#2   BigM_35              1
    y#2#6#2   valid_5              6
    y#2#6#2   valid_4             31
    y#2#6#2   valid_3             35
    y#2#6#2   balan@11             6
    y#2#6#2   balanc@e            31
    y#2#6#2   balanc@b            35
    y#2#6#3   BigM_36              1
    y#2#6#3   valid_5              6
    y#2#6#3   valid_4             31
    y#2#6#3   valid_3             35
    y#2#6#3   balan@12             6
    y#2#6#3   balanc@f            31
    y#2#6#3   balanc@c            35
    y#3#1#1   BigM_37              1
    y#3#1#1   valid_8             26
    y#3#1#1   valid_7              4
    y#3#1#1   valid_6             42
    y#3#1#1   balan@19            26
    y#3#1#1   balan@16             4
    y#3#1#1   balan@13            42
    y#3#1#2   BigM_38              1
    y#3#1#2   valid_8             26
    y#3#1#2   valid_7              4
    y#3#1#2   valid_6             42
    y#3#1#2   balan@1a            26
    y#3#1#2   balan@17             4
    y#3#1#2   balan@14            42
    y#3#1#3   BigM_39              1
    y#3#1#3   valid_8             26
    y#3#1#3   valid_7              4
    y#3#1#3   valid_6             42
    y#3#1#3   balan@1b            26
    y#3#1#3   balan@18             4
    y#3#1#3   balan@15            42
    y#3#2#1   BigM_40              1
    y#3#2#1   valid_8             16
    y#3#2#1   valid_7             23
    y#3#2#1   valid_6             33
    y#3#2#1   balan@19            16
    y#3#2#1   balan@16            23
    y#3#2#1   balan@13            33
    y#3#2#2   BigM_41              1
    y#3#2#2   valid_8             16
    y#3#2#2   valid_7             23
    y#3#2#2   valid_6             33
    y#3#2#2   balan@1a            16
    y#3#2#2   balan@17            23
    y#3#2#2   balan@14            33
    y#3#2#3   BigM_42              1
    y#3#2#3   valid_8             16
    y#3#2#3   valid_7             23
    y#3#2#3   valid_6             33
    y#3#2#3   balan@1b            16
    y#3#2#3   balan@18            23
    y#3#2#3   balan@15            33
    y#3#3#1   BigM_43              1
    y#3#3#1   valid_8             16
    y#3#3#1   valid_7             15
    y#3#3#1   valid_6             41
    y#3#3#1   balan@19            16
    y#3#3#1   balan@16            15
    y#3#3#1   balan@13            41
    y#3#3#2   BigM_44              1
    y#3#3#2   valid_8             16
    y#3#3#2   valid_7             15
    y#3#3#2   valid_6             41
    y#3#3#2   balan@1a            16
    y#3#3#2   balan@17            15
    y#3#3#2   balan@14            41
    y#3#3#3   BigM_45              1
    y#3#3#3   valid_8             16
    y#3#3#3   valid_7             15
    y#3#3#3   valid_6             41
    y#3#3#3   balan@1b            16
    y#3#3#3   balan@18            15
    y#3#3#3   balan@15            41
    y#3#4#1   BigM_46              1
    y#3#4#1   valid_8              9
    y#3#4#1   valid_7             48
    y#3#4#1   valid_6             15
    y#3#4#1   balan@19             9
    y#3#4#1   balan@16            48
    y#3#4#1   balan@13            15
    y#3#4#2   BigM_47              1
    y#3#4#2   valid_8              9
    y#3#4#2   valid_7             48
    y#3#4#2   valid_6             15
    y#3#4#2   balan@1a             9
    y#3#4#2   balan@17            48
    y#3#4#2   balan@14            15
    y#3#4#3   BigM_48              1
    y#3#4#3   valid_8              9
    y#3#4#3   valid_7             48
    y#3#4#3   valid_6             15
    y#3#4#3   balan@1b             9
    y#3#4#3   balan@18            48
    y#3#4#3   balan@15            15
    y#3#5#1   BigM_49              1
    y#3#5#1   valid_8              1
    y#3#5#1   valid_7             44
    y#3#5#1   valid_6             27
    y#3#5#1   balan@19             1
    y#3#5#1   balan@16            44
    y#3#5#1   balan@13            27
    y#3#5#2   BigM_50              1
    y#3#5#2   valid_8              1
    y#3#5#2   valid_7             44
    y#3#5#2   valid_6             27
    y#3#5#2   balan@1a             1
    y#3#5#2   balan@17            44
    y#3#5#2   balan@14            27
    y#3#5#3   BigM_51              1
    y#3#5#3   valid_8              1
    y#3#5#3   valid_7             44
    y#3#5#3   valid_6             27
    y#3#5#3   balan@1b             1
    y#3#5#3   balan@18            44
    y#3#5#3   balan@15            27
    y#3#6#1   BigM_52              1
    y#3#6#1   valid_8              6
    y#3#6#1   valid_7             31
    y#3#6#1   valid_6             35
    y#3#6#1   balan@19             6
    y#3#6#1   balan@16            31
    y#3#6#1   balan@13            35
    y#3#6#2   BigM_53              1
    y#3#6#2   valid_8              6
    y#3#6#2   valid_7             31
    y#3#6#2   valid_6             35
    y#3#6#2   balan@1a             6
    y#3#6#2   balan@17            31
    y#3#6#2   balan@14            35
    y#3#6#3   BigM_54              1
    y#3#6#3   valid_8              6
    y#3#6#3   valid_7             31
    y#3#6#3   valid_6             35
    y#3#6#3   balan@1b             6
    y#3#6#3   balan@18            31
    y#3#6#3   balan@15            35
    z#1       BigM_39           -242
    z#1       BigM_38           -242
    z#1       BigM_37           -242
    z#1       BigM_21           -221
    z#1       BigM_20           -221
    z#1       BigM_19           -221
    z#1       BigM_3             -43
    z#1       BigM_2             -43
    z#1       BigM_1             -43
    z#1       select_1             1
    z#2       BigM_42            -96
    z#2       BigM_41            -96
    z#2       BigM_40            -96
    z#2       BigM_24           -106
    z#2       BigM_23           -106
    z#2       BigM_22           -106
    z#2       BigM_6             -69
    z#2       BigM_5             -69
    z#2       BigM_4             -69
    z#2       select_1             1
    z#3       BigM_45            -96
    z#3       BigM_44            -96
    z#3       BigM_43            -96
    z#3       BigM_27           -106
    z#3       BigM_26           -106
    z#3       BigM_25           -106
    z#3       BigM_9             -69
    z#3       BigM_8             -69
    z#3       BigM_7             -69
    z#3       select_1             1
    z#4       BigM_48           -170
    z#4       BigM_47           -170
    z#4       BigM_46           -170
    z#4       BigM_30           -189
    z#4       BigM_29           -189
    z#4       BigM_28           -189
    z#4       BigM_12           -122
    z#4       BigM_11           -122
    z#4       BigM_10           -122
    z#4       select_1             1
    z#5       BigM_51          -1529
    z#5       BigM_50          -1529
    z#5       BigM_49          -1529
    z#5       BigM_33          -1693
    z#5       BigM_32          -1693
    z#5       BigM_31          -1693
    z#5       BigM_15          -1097
    z#5       BigM_14          -1097
    z#5       BigM_13          -1097
    z#5       select_1             1
    z#6       BigM_54           -255
    z#6       BigM_53           -255
    z#6       BigM_52           -255
    z#6       BigM_36           -283
    z#6       BigM_35           -283
    z#6       BigM_34           -283
    z#6       BigM_18           -183
    z#6       BigM_17           -183
    z#6       BigM_16           -183
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
    r#1#3#0   init2_3              1
    r#1#3#0   balanc@7            -1
    r#1#3#1   OBJECTIV           5.5
    r#1#3#1   balanc@8            -1
    r#1#3#1   balanc@7             1
    r#1#3#2   OBJECTIV           5.5
    r#1#3#2   balanc@9            -1
    r#1#3#2   balanc@8             1
    r#1#3#3   OBJECTIV           5.5
    r#1#3#3   init3_3              1
    r#1#3#3   balanc@9             1
    r#2#1#0   init2_4              1
    r#2#1#0   balanc@a            -1
    r#2#1#1   OBJECTIV             5
    r#2#1#1   balanc@b            -1
    r#2#1#1   balanc@a             1
    r#2#1#2   OBJECTIV             5
    r#2#1#2   balanc@c            -1
    r#2#1#2   balanc@b             1
    r#2#1#3   OBJECTIV             5
    r#2#1#3   init3_4              1
    r#2#1#3   balanc@c             1
    r#2#2#0   init2_5              1
    r#2#2#0   balanc@d            -1
    r#2#2#1   OBJECTIV           5.5
    r#2#2#1   balanc@e            -1
    r#2#2#1   balanc@d             1
    r#2#2#2   OBJECTIV           5.5
    r#2#2#2   balanc@f            -1
    r#2#2#2   balanc@e             1
    r#2#2#3   OBJECTIV           5.5
    r#2#2#3   init3_5              1
    r#2#2#3   balanc@f             1
    r#2#3#0   init2_6              1
    r#2#3#0   balan@10            -1
    r#2#3#1   OBJECTIV           5.5
    r#2#3#1   balan@11            -1
    r#2#3#1   balan@10             1
    r#2#3#2   OBJECTIV           5.5
    r#2#3#2   balan@12            -1
    r#2#3#2   balan@11             1
    r#2#3#3   OBJECTIV           5.5
    r#2#3#3   init3_6              1
    r#2#3#3   balan@12             1
    r#3#1#0   init2_7              1
    r#3#1#0   balan@13            -1
    r#3#1#1   OBJECTIV             5
    r#3#1#1   balan@14            -1
    r#3#1#1   balan@13             1
    r#3#1#2   OBJECTIV             5
    r#3#1#2   balan@15            -1
    r#3#1#2   balan@14             1
    r#3#1#3   OBJECTIV             5
    r#3#1#3   init3_7              1
    r#3#1#3   balan@15             1
    r#3#2#0   init2_8              1
    r#3#2#0   balan@16            -1
    r#3#2#1   OBJECTIV           5.5
    r#3#2#1   balan@17            -1
    r#3#2#1   balan@16             1
    r#3#2#2   OBJECTIV           5.5
    r#3#2#2   balan@18            -1
    r#3#2#2   balan@17             1
    r#3#2#3   OBJECTIV           5.5
    r#3#2#3   init3_8              1
    r#3#2#3   balan@18             1
    r#3#3#0   init2_9              1
    r#3#3#0   balan@19            -1
    r#3#3#1   OBJECTIV           5.5
    r#3#3#1   balan@1a            -1
    r#3#3#1   balan@19             1
    r#3#3#2   OBJECTIV           5.5
    r#3#3#2   balan@1b            -1
    r#3#3#2   balan@1a             1
    r#3#3#3   OBJECTIV           5.5
    r#3#3#3   init3_9              1
    r#3#3#3   balan@1b             1
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
    s#1#3#0   init1_3              1
    s#1#3#0   balanc@7             1
    s#1#3#1   OBJECTIV           1.1
    s#1#3#1   balanc@8             1
    s#1#3#1   balanc@7            -1
    s#1#3#2   OBJECTIV           1.1
    s#1#3#2   balanc@9             1
    s#1#3#2   balanc@8            -1
    s#1#3#3   OBJECTIV           1.1
    s#1#3#3   balanc@9            -1
    s#2#1#0   init1_4              1
    s#2#1#0   balanc@a             1
    s#2#1#1   OBJECTIV             1
    s#2#1#1   balanc@b             1
    s#2#1#1   balanc@a            -1
    s#2#1#2   OBJECTIV             1
    s#2#1#2   balanc@c             1
    s#2#1#2   balanc@b            -1
    s#2#1#3   OBJECTIV             1
    s#2#1#3   balanc@c            -1
    s#2#2#0   init1_5              1
    s#2#2#0   balanc@d             1
    s#2#2#1   OBJECTIV           1.1
    s#2#2#1   balanc@e             1
    s#2#2#1   balanc@d            -1
    s#2#2#2   OBJECTIV           1.1
    s#2#2#2   balanc@f             1
    s#2#2#2   balanc@e            -1
    s#2#2#3   OBJECTIV           1.1
    s#2#2#3   balanc@f            -1
    s#2#3#0   init1_6              1
    s#2#3#0   balan@10             1
    s#2#3#1   OBJECTIV           1.1
    s#2#3#1   balan@11             1
    s#2#3#1   balan@10            -1
    s#2#3#2   OBJECTIV           1.1
    s#2#3#2   balan@12             1
    s#2#3#2   balan@11            -1
    s#2#3#3   OBJECTIV           1.1
    s#2#3#3   balan@12            -1
    s#3#1#0   init1_7              1
    s#3#1#0   balan@13             1
    s#3#1#1   OBJECTIV             1
    s#3#1#1   balan@14             1
    s#3#1#1   balan@13            -1
    s#3#1#2   OBJECTIV             1
    s#3#1#2   balan@15             1
    s#3#1#2   balan@14            -1
    s#3#1#3   OBJECTIV             1
    s#3#1#3   balan@15            -1
    s#3#2#0   init1_8              1
    s#3#2#0   balan@16             1
    s#3#2#1   OBJECTIV           1.1
    s#3#2#1   balan@17             1
    s#3#2#1   balan@16            -1
    s#3#2#2   OBJECTIV           1.1
    s#3#2#2   balan@18             1
    s#3#2#2   balan@17            -1
    s#3#2#3   OBJECTIV           1.1
    s#3#2#3   balan@18            -1
    s#3#3#0   init1_9              1
    s#3#3#0   balan@19             1
    s#3#3#1   OBJECTIV           1.1
    s#3#3#1   balan@1a             1
    s#3#3#1   balan@19            -1
    s#3#3#2   OBJECTIV           1.1
    s#3#3#2   balan@1b             1
    s#3#3#2   balan@1a            -1
    s#3#3#3   OBJECTIV           1.1
    s#3#3#3   balan@1b            -1
RHS
    RHS       select_1             1
    RHS       balanc@1           964
    RHS       balanc@2            21
    RHS       balanc@3           337
    RHS       balanc@7           371
    RHS       balanc@8           573
    RHS       balanc@9           153
    RHS       balanc@a           333
    RHS       balanc@b           776
    RHS       balanc@c           466
    RHS       balanc@d           239
    RHS       balanc@e           425
    RHS       balanc@f           220
    RHS       balan@10           852
    RHS       balan@11            50
    RHS       balan@12           791
    RHS       balan@13           136
    RHS       balan@14           621
    RHS       balan@15           192
    RHS       balan@16             7
    RHS       balan@17            27
    RHS       balan@18           934
    RHS       balan@19          1000
    RHS       balan@1a           237
    RHS       balan@1b           292
    RHS       valid_1           1322
    RHS       valid_2           1097
    RHS       valid_3           1575
    RHS       valid_4            884
    RHS       valid_5           1693
    RHS       valid_6            949
    RHS       valid_7            968
    RHS       valid_8           1529
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
 LO BOUND     r#1#3#0              0
 PL BOUND     r#1#3#0 
 LO BOUND     r#1#3#1              0
 PL BOUND     r#1#3#1 
 LO BOUND     r#1#3#2              0
 PL BOUND     r#1#3#2 
 LO BOUND     r#1#3#3              0
 PL BOUND     r#1#3#3 
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
 LO BOUND     r#2#3#0              0
 PL BOUND     r#2#3#0 
 LO BOUND     r#2#3#1              0
 PL BOUND     r#2#3#1 
 LO BOUND     r#2#3#2              0
 PL BOUND     r#2#3#2 
 LO BOUND     r#2#3#3              0
 PL BOUND     r#2#3#3 
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
 LO BOUND     r#3#3#0              0
 PL BOUND     r#3#3#0 
 LO BOUND     r#3#3#1              0
 PL BOUND     r#3#3#1 
 LO BOUND     r#3#3#2              0
 PL BOUND     r#3#3#2 
 LO BOUND     r#3#3#3              0
 PL BOUND     r#3#3#3 
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
 LO BOUND     s#1#3#0              0
 PL BOUND     s#1#3#0 
 LO BOUND     s#1#3#1              0
 PL BOUND     s#1#3#1 
 LO BOUND     s#1#3#2              0
 PL BOUND     s#1#3#2 
 LO BOUND     s#1#3#3              0
 PL BOUND     s#1#3#3 
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
 LO BOUND     s#2#3#0              0
 PL BOUND     s#2#3#0 
 LO BOUND     s#2#3#1              0
 PL BOUND     s#2#3#1 
 LO BOUND     s#2#3#2              0
 PL BOUND     s#2#3#2 
 LO BOUND     s#2#3#3              0
 PL BOUND     s#2#3#3 
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
 LO BOUND     s#3#3#0              0
 PL BOUND     s#3#3#0 
 LO BOUND     s#3#3#1              0
 PL BOUND     s#3#3#1 
 LO BOUND     s#3#3#2              0
 PL BOUND     s#3#3#2 
 LO BOUND     s#3#3#3              0
 PL BOUND     s#3#3#3 
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
 LO BOUND     x#1#3#1              0
 PL BOUND     x#1#3#1 
 LO BOUND     x#1#3#2              0
 PL BOUND     x#1#3#2 
 LO BOUND     x#1#3#3              0
 PL BOUND     x#1#3#3 
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
 LO BOUND     x#2#3#1              0
 PL BOUND     x#2#3#1 
 LO BOUND     x#2#3#2              0
 PL BOUND     x#2#3#2 
 LO BOUND     x#2#3#3              0
 PL BOUND     x#2#3#3 
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
 LO BOUND     x#3#3#1              0
 PL BOUND     x#3#3#1 
 LO BOUND     x#3#3#2              0
 PL BOUND     x#3#3#2 
 LO BOUND     x#3#3#3              0
 PL BOUND     x#3#3#3 
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
