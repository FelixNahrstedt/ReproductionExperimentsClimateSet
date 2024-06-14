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
sbatch Slurm/Final_Design/Climax
sbatch Slurm/Final_Design/Climax_Frozen
sbatch Slurm/Final_Design/Unet
sbatch Slurm/Final_Design/ConvLSTM
# sbatch Slurm/Final_Design/test


