process FILTLONG {

    tag "${reads.simpleName}"

    container 'filtlong:latest'
    publishDir "results/filtlong", mode: 'copy'

    input:
    path reads

    output:
    path "${reads.simpleName}.filtlong.fastq", emit: filtered

    script:
    def targetBases = params.filtlong_target_bases ?
        "--target_bases ${params.filtlong_target_bases}" : ""

    """
    filtlong \
      ${targetBases} \
      --keep_percent ${params.filtlong_keep_percent} \
      --min_length ${params.filtlong_min_length} \
      ${reads} \
      > ${reads.simpleName}.filtlong.fastq
    """
}
