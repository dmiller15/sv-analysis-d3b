class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: svaba
baseCommand:
  - svaba
  - run
inputs:
  - id: name
    type: string
    inputBinding:
      position: 0
      prefix: '--id-string'
  - id: tbam
    type: File
    inputBinding:
      position: 0
      prefix: '-t'
    secondaryFiles:
      - .bai
  - id: nbam
    type: 'File[]'
    inputBinding:
      position: 0
      prefix: '-n'
      itemSeparator: ' -n '
      shellQuote: false
    secondaryFiles:
      - .bai
  - id: ref
    type: File
    inputBinding:
      position: 0
      prefix: '--reference-genome'
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .fai
      - .pac
      - .sa
  - id: dbsnp
    type: File
    inputBinding:
      position: 0
      prefix: '--dbsnp-vcf'
  - id: threads
    type: int?
    inputBinding:
      position: 0
      prefix: '-p'
outputs:
  - id: alignments
    type: File
    outputBinding:
      glob: $(inputs.name).alignments.txt.gz
  - id: bps
    type: File
    outputBinding:
      glob: $(inputs.name).bps.txt.gz
  - id: configs
    type: File
    outputBinding:
      glob: $(inputs.name).contigs.bam
  - id: log
    type: File
    outputBinding:
      glob: $(inputs.name).log
  - id: germline-indel-vcf
    type: File
    outputBinding:
      glob: $(inputs.name).svaba.germline.indel.vcf
  - id: germline-sv-vcf
    type: File
    outputBinding:
      glob: $(inputs.name).svaba.sv.indel.vcf
  - id: somatic-indel-vcf
    type: File
    outputBinding:
      glob: $(inputs.name).svaba.somatic.indel.vcf
  - id: somatic-sv-vcf
    type: File
    outputBinding:
      glob: $(inputs.name).svaba.somatic.sv.vcf
  - id: germline-indel-unfiltered-vcf
    type: File
    outputBinding:
      glob: $(inputs.name).svaba.unfiltered.germline.indel.vcf
  - id: germline-sv-unfiltered-vcf
    type: File
    outputBinding:
      glob: $(inputs.name).svaba.unfiltered.germline.sv.vcf
  - id: somatic-indel-unfiltered-vcf
    type: File
    outputBinding:
      glob: $(inputs.name).svaba.unfiltered.somatic.indel.vcf
  - id: somatic-sv-unfiltered-vcf
    type: File
    outputBinding:
      glob: $(inputs.name).svaba.unfiltered.somatic.sv.vcf
label: svaba
requirements:
  - class: DockerRequirement
    dockerPull: 'svaba:1.1.0'
  - class: InlineJavascriptRequirement
