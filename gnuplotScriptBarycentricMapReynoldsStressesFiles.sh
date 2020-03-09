#!/usr/bin/gnuplot -persist

set style line 1 lt 1 lw 2.5 ps 1.25 pt 9 linecolor rgb "black"
set style line 2 lt 2 lw 2.5 ps 1.25 pt 2 linecolor rgb "black"
set style line 3 lt 3 lw 2.5 ps 1.25 pt 3 linecolor rgb "black"
set style line 4 lt 4 lw 2.5 ps 1.1 pt 2 linecolor rgb "brown"
set style line 5 lt 5 lw 2.5 ps 1.1 pt 3 linecolor rgb "gold"
set style line 6 lt 6 lw 2.5 ps 1.1 pt 1 linecolor rgb "red"
set style line 7 lt 7 lw 2.5 ps 1.1 pt 2 linecolor rgb "green"
set style line 8 lt 8 lw 2.5 ps 1.1 pt 3 linecolor rgb "blue"
set style line 11 lt 11 lw 2.5 ps 1.1 pt 3 linecolor rgb "dark-red"
set style line 12 lt 12 lw 2.5 ps 1.1 pt 3 linecolor rgb "light-red"
set style line 13 lt 13 lw 2.5 ps 1.1 pt 3 linecolor rgb "dark-green"
set style line 14 lt 14 lw 2.5 ps 1.1 pt 3 linecolor rgb "light-green"
set style line 15 lt 15 lw 2.5 ps 1.1 pt 3 linecolor rgb "dark-blue"
set style line 16 lt 16 lw 2.5 ps 1.1 pt 3 linecolor rgb "light-blue"

set style line 21 lt 21 lw 2.5 ps 1.1 pt 3 linecolor rgb "orange-red"
set style line 22 lt 22 lw 2.5 ps 1.1 pt 3 linecolor rgb "sea-green"
set style line 23 lt 23 lw 2.5 ps 1.1 pt 3 linecolor rgb "spring-green"
set style line 24 lt 24 lw 2.5 ps 1.1 pt 3 linecolor rgb "dark-orange"
set style line 25 lt 25 lw 2.5 ps 1.1 pt 3 linecolor rgb "royalblue"
set style line 26 lt 26 lw 2.5 ps 1.1 pt 3 linecolor rgb "orange-red"

set style line 30 lt 1 lw 2.5 ps 1.25 pt 9 linecolor rgb "black"
set style line 50 lt 1 lw 3.0 pt 1 linecolor rgb "red"


# WALE model     

# Reynolds stresses anisotropy tensor in the barycentric map ReTau = 395: WALE mesh comparisons
unset label
set term postscript eps enhanced color
set output 'meshComparisonsWaleReynoldsStressesAnisotropyTensorBarycentricMapReTau395.eps'
set size 0.8,0.8
set size ratio 0.866
set yrange [0.0:0.866]
set xrange [0.0:1.0]
set noborder
set noxtics
set noytics
set arrow 1 from 0.0,0.0 to 0.5,(sqrt(3.0)/2.0) nohead front lt -1 lw 2.0
set arrow 2 from 0.0,0.0 to 1.0,0.0             nohead front lt -1 lw 2.0
set arrow 3 from 1.0,0.0 to 0.5,(sqrt(3.0)/2.0) nohead front lt -1 lw 2.0
set label 1 '{/:Bold x}_{1c}' at 0.0-0.035,0.0-0.02
set label 2 '{/:Bold x}_{2c}' at 1.0+0.01,0.0-0.02
set label 3 '{/:Bold x}_{3c}' at 0.5-0.02,(sqrt(3.0)/2.0)+0.026
set label 4 '{y = 0}' at 0.45,0.0+0.025
set label 5 '{y = h}' at 0.45,0.73

plot 'MKMReTau395_ReynoldsStressesBarycentricMap.dat' using ($2):($3) w l ls 30 title 'Moser et al.', \
     'WaleBaseModelReTau395_ReynoldsStressesBarycentricMap_32x32x32.dat' using ($4):($5) w p ls 11 title 'LES 32x32x32', \
     'WaleBaseModelReTau395_ReynoldsStressesBarycentricMap_32x64x48.dat' using ($4):($5) w p ls 21 title 'LES 32x64x48', \
     'WaleBaseModelReTau395_ReynoldsStressesBarycentricMap_64x64x64.dat' using ($4):($5) w p ls 13 title 'LES 64x64x64', \
     'WaleBaseModelReTau395_ReynoldsStressesBarycentricMap_64x128x64.dat' using ($4):($5) w p ls 15 title 'LES 64x128x64', \
     'WaleBaseModelReTau395_ReynoldsStressesBarycentricMap_64x128x96.dat' using ($4):($5) w p ls 5 title 'LES 64x128x96', \
     'DnsReTau395_ReynoldsStressesBarycentricMap.dat' using ($4):($5) w p ls 1 title 'DNS'

# Reynolds stresses anisotropy tensor in the barycentric map ReTau = 395: WALE UQ magnitude realizability advection_ij
unset label
set term postscript eps enhanced color
set output 'UqMagnitudeWaleReynoldsStressesAnisotropyTensorBarycentricMapReTau395.eps'
set size 0.8,0.8
set size ratio 0.866
set yrange [0.0:0.866]
set xrange [0.0:1.0]
set noborder
set noxtics
set noytics
set arrow 1 from 0.0,0.0 to 0.5,(sqrt(3.0)/2.0) nohead front lt -1 lw 2.0
set arrow 2 from 0.0,0.0 to 1.0,0.0             nohead front lt -1 lw 2.0
set arrow 3 from 1.0,0.0 to 0.5,(sqrt(3.0)/2.0) nohead front lt -1 lw 2.0
set label 1 '{/:Bold x}_{1c}' at 0.0-0.035,0.0-0.02
set label 2 '{/:Bold x}_{2c}' at 1.0+0.01,0.0-0.02
set label 3 '{/:Bold x}_{3c}' at 0.5-0.02,(sqrt(3.0)/2.0)+0.026
set label 4 '{y = 0}' at 0.45,0.0+0.025
set label 5 '{y = h}' at 0.45,0.73

plot 'MKMReTau395_ReynoldsStressesBarycentricMap.dat' using ($2):($3) w l ls 30 title 'Moser et al.', \
     'WaleBaseModelReTau395_ReynoldsStressesBarycentricMap.dat' using ($4):($5) w p ls 1 title 'base-model', \
     'WaleCoeffNegReTau395_ReynoldsStressesBarycentricMap.dat' using ($4):($5) w l ls 21 title '{/Symbol D}{/Symbol t}_{kk} < 0', \
     'WaleCoeff0ReTau395_ReynoldsStressesBarycentricMap.dat' using ($4):($5) w l ls 23 title '{/Symbol D}{/Symbol t}_{kk} = 0', \
     'WaleCoeffPosReTau395_ReynoldsStressesBarycentricMap.dat' using ($4):($5) w l ls 25 title '{/Symbol D}{/Symbol t}_{kk} > 0'     

# Reynolds stresses anisotropy tensor in the barycentric map ReTau = 395: WALE UQ eigenvalues realizability advection_ij
unset label
set term postscript eps enhanced color
set output 'UqEigenvaluesWaleReynoldsStressesAnisotropyTensorBarycentricMapReTau395.eps'
set size 0.8,0.8
set size ratio 0.866
set yrange [0.0:0.866]
set xrange [0.0:1.0]
set noborder
set noxtics
set noytics
set arrow 1 from 0.0,0.0 to 0.5,(sqrt(3.0)/2.0) nohead front lt -1 lw 2.0
set arrow 2 from 0.0,0.0 to 1.0,0.0             nohead front lt -1 lw 2.0
set arrow 3 from 1.0,0.0 to 0.5,(sqrt(3.0)/2.0) nohead front lt -1 lw 2.0
set label 1 '{/:Bold x}_{1c}' at 0.0-0.035,0.0-0.02
set label 2 '{/:Bold x}_{2c}' at 1.0+0.01,0.0-0.02
set label 3 '{/:Bold x}_{3c}' at 0.5-0.02,(sqrt(3.0)/2.0)+0.026
set label 4 '{y = 0}' at 0.45,0.0+0.025
set label 5 '{y = h}' at 0.45,0.73

plot 'MKMReTau395_ReynoldsStressesBarycentricMap.dat' using ($2):($3) w l ls 30 title 'Moser et al.', \
     'WaleBaseModelReTau395_ReynoldsStressesBarycentricMap.dat' using ($4):($5) w p ls 1 title 'base-model', \
     'WaleOneCompReTau395_ReynoldsStressesBarycentricMap.dat' using ($4):($5) w l ls 6 title '1-comp.', \
     'WaleTwoCompReTau395_ReynoldsStressesBarycentricMap.dat' using ($4):($5) w l ls 7 title '2-comp.', \
     'WaleThreeCompReTau395_ReynoldsStressesBarycentricMap.dat' using ($4):($5) w l ls 8 title '3-comp.'


# Reynolds stresses anisotropy tensor in the barycentric map ReTau = 395: WALE UQ eigenvectors realizability advection_ij
unset label
set term postscript eps enhanced color
set output 'UqEigenvectorsWaleReynoldsStressesAnisotropyTensorBarycentricMapReTau395.eps'
set size 0.8,0.8
set size ratio 0.866
set yrange [0.0:0.866]
set xrange [0.0:1.0]
set noborder
set noxtics
set noytics
set arrow 1 from 0.0,0.0 to 0.5,(sqrt(3.0)/2.0) nohead front lt -1 lw 2.0
set arrow 2 from 0.0,0.0 to 1.0,0.0             nohead front lt -1 lw 2.0
set arrow 3 from 1.0,0.0 to 0.5,(sqrt(3.0)/2.0) nohead front lt -1 lw 2.0
set label 1 '{/:Bold x}_{1c}' at 0.0-0.035,0.0-0.02
set label 2 '{/:Bold x}_{2c}' at 1.0+0.01,0.0-0.02
set label 3 '{/:Bold x}_{3c}' at 0.5-0.02,(sqrt(3.0)/2.0)+0.026
set label 4 '{y = 0}' at 0.45,0.0+0.025
set label 5 '{y = h}' at 0.45,0.73

plot 'MKMReTau395_ReynoldsStressesBarycentricMap.dat' using ($2):($3) w l ls 30 title 'Moser et al.', \
     'WaleBaseModelReTau395_ReynoldsStressesBarycentricMap.dat' using ($4):($5) w p ls 1 title 'base-model', \
     'WalePerm1ReTau395_ReynoldsStressesBarycentricMap.dat' using ($4):($5) w l ls 11 title 'perm. 1', \
     'WalePerm2ReTau395_ReynoldsStressesBarycentricMap.dat' using ($4):($5) w l ls 13 title 'perm. 2', \
     'WalePerm3ReTau395_ReynoldsStressesBarycentricMap.dat' using ($4):($5) w l ls 15 title 'perm. 3'
