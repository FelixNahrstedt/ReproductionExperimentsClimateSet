pwd

while true; do
    read -p "Do you wish to remove old files? " yn
    case $yn in
        [Yy]* ) rm -f ../Slurm/{*,.*}; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


##  RUN 1
sbatch Slurm/Num_Workers/convlstm/0
sbatch Slurm/Num_Workers/convlstm/2
sbatch Slurm/Num_Workers/convlstm/4
sbatch Slurm/Num_Workers/convlstm/8
sbatch Slurm/Num_Workers/convlstm/16

# ##  RUN 2
sbatch Slurm/Num_Workers/climax/0
sbatch Slurm/Num_Workers/climax/2
sbatch Slurm/Num_Workers/climax/4
sbatch Slurm/Num_Workers/climax/8
sbatch Slurm/Num_Workers/climax/16

sbatch Slurm/Num_Workers/climax_frozen/0
sbatch Slurm/Num_Workers/climax_frozen/2
sbatch Slurm/Num_Workers/climax_frozen/4
sbatch Slurm/Num_Workers/climax_frozen/8
sbatch Slurm/Num_Workers/climax_frozen/16

# ##  RUN 1
sbatch Slurm/Num_Workers/unet/0
sbatch Slurm/Num_Workers/unet/2
sbatch Slurm/Num_Workers/unet/4
sbatch Slurm/Num_Workers/unet/8
sbatch Slurm/Num_Workers/unet/16
sbatch Slurm/Num_Workers/unet/32

