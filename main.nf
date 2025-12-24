nextflow.enable.dsl=2

include { NANOPLOT_QC as NANOPLOT_RAW }      from './modules/nanoplot.nf'
include { NANOPLOT_QC as NANOPLOT_FILTERED } from './modules/nanoplot.nf'
include { FILTLONG }                         from './modules/filtlong.nf'

workflow {

    reads = Channel.fromPath("data/*.fastq.gz")

    NANOPLOT_RAW (reads, 'raw')
    filtered = FILTLONG(reads)
    NANOPLOT_FILTERED (filtered, 'filtered')
}
