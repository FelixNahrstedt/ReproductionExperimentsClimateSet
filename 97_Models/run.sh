pwd

while true; do
    read -p "Do you wish to remove old files? " yn
    case $yn in
        [Yy]* ) rm -f ../Slurm/{*,.*}; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


sbatch Slurm/97_Models/conv_97
sbatch Slurm/97_Models/climax_97



echo "Success - Go sleep and see your results in the morning!"