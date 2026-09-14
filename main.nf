
nextflow.enable.dsl=2

//Creer et executer un pipeline minimal qui permet
//transformer un texte donné en majuscules.
params.text = " Hello the baby is crying. "
process UPPER {

    container 'ubuntu:22.04'

    input:
    val text

    output:
    stdout

    script:
    """
    echo "$text" | tr 'a-z' 'A-Z'
    """
}
// Rajouter des points d'exclamation au texte

process add_text {

    container 'ubuntu:22.04'

    input:
    val text

    output:
    stdout

    script:
    """
    echo "$text !!!"
    """
}
workflow {
    text_ch = Channel.of(params.text)
    upper_ch= UPPER(text_ch)
    add_text(upper_ch)
    
}