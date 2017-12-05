#!/bin/bash
cat PUFspTOP >> $2
python CtP.py $1 >> $2
cat PUFspBOTTOM >> $2
