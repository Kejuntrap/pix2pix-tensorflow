cd pix2pix-tensorflow
python pix2pix.py --mode train --output_dir facades_train --max_epochs 100 --input_dir facades\train  --which_direction BtoA
python pix2pix.py   --mode test   --output_dir facades_test   --input_dir facades/val   --checkpoint facades_train
pause