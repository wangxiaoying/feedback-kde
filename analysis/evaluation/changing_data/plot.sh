#!/usr/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/../../conf.sh
echo $DIR/5_adaptive_raw.log
python $DIR/analyze.py $DIR/5_heuristic_raw.log > 5_heuristic_aggregated.log
python $DIR/analyze.py $DIR/5_adaptive_tkr_raw.log > 5_adaptive_tkr_aggregated.log
python $DIR/analyze.py $DIR/5_stholes_raw.log > 5_stholes_aggregated.log

python $DIR/analyze.py $DIR/8_heuristic_raw.log > 8_heuristic_aggregated.log
python $DIR/analyze.py $DIR/8_adaptive_tkr_raw.log > 8_adaptive_tkr_aggregated.log
python $DIR/analyze.py $DIR/8_stholes_raw.log > 8_stholes_aggregated.log

gnuplot plot5.gnuplot
gnuplot plot8.gnuplot
