# Chromosome_Plot

1.Genome length file: <br>
 >Chr1A\t1\t1000<br>
 >Chr1B\t1\t2000<br>

2.Sliding window bed file<br>
 bedtools makewindows -b Chr.Length.Start.txt -w 1000000 -s 500000 > Split8.1Mb.500K.bed <br>

3.Bam file index <br>
samtools index T176-1.Realign.bam <br>

4.Coverage (Depth) Summary <br>
bedtools multicov -bams T176-1.Realign.bam -bed Split8.1Mb.500K.bed > Exome.Split8.1Mb.500K.coverage <br>


![Results](Coverage.png)

5.Plot depth along chromosomes <br>

Rscript Chromosome_Depth.R Exome.Split8.1Mb.500K.coverage Exome.Split8.1Mb.500K.png <br>

Results: <br>

![](chr_distribution.png)