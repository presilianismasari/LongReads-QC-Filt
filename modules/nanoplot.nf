process NANOPLOT_QC {

    tag "${stage}:${reads.simpleName}"

    container 'nanoplot:latest'
    publishDir "results/nanoplot/${stage}", mode: 'copy'

    input:
    path reads
    val stage

    output:
    path "nanoplot_${stage}_${reads.simpleName}", emit: qc_dir

    script:
    """
    NanoPlot \
      --fastq ${reads} \
      --outdir nanoplot_${stage}_${reads.simpleName} \
      --threads ${task.cpus}
    """
}
