#/usr/bin/env bash
_neurospaces_configuration_completions()
{
    COMPLETIONS=`neurospaces-workflow --bash-completion "$COMP_LINE" $COMP_CWORD $COMP_POINT`

    COMPREPLY=($(compgen -W "$COMPLETIONS" -- "${COMP_WORDS[$COMP_CWORD]}"))
}

complete -F _neurospaces_configuration_completions neurospaces-configuration
complete -F _neurospaces_configuration_completions ./neurospaces-configuration


_neurospaces_workflow_completions()
{
    COMPLETIONS=`neurospaces-workflow --bash-completion "$COMP_LINE" $COMP_CWORD $COMP_POINT`

    COMPREPLY=($(compgen -W "$COMPLETIONS" -- "${COMP_WORDS[$COMP_CWORD]}"))
}

complete -F _neurospaces_configuration_completions neurospaces-workflow
complete -F _neurospaces_configuration_completions ./neurospaces-workflow

