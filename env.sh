apply_cmssw_customization_steps() {
    run_cmd mkdir -p gifDisplay
    run_cmd ln -s "$ANALYSIS_PATH/GifDisplay" gifDisplay/GifDisplay
    run_cmd ln -s "$ANALYSIS_PATH/CSCEventDisplay.py" gifDisplay/CSCEventDisplay.py
    run_cmd ln -s "$ANALYSIS_PATH/eventList.txt" gifDisplay/eventList.txt
}

CMSSW_VERSION="CMSSW_13_0_3"

action() {
    local this_file="$( [ ! -z "$ZSH_VERSION" ] && echo "${(%):-%x}" || echo "${BASH_SOURCE[0]}" )"
    local this_dir="$( cd "$( dirname "$this_file" )" && pwd )"
    local this_file_path="$this_dir/$(basename $this_file)"
    export ANALYSIS_PATH="$this_dir"
    echo "Running action with CMSSW version: $CMSSW_VERSION"
    echo source $ANALYSIS_PATH/GEM-CSC-trg-dev/env.sh "$this_file_path" "$CMSSW_VERSION" "$@"
    source $ANALYSIS_PATH/GEM-CSC-trg-dev/env.sh "$this_file_path" "$CMSSW_VERSION" "$@"
}
action "$@"
# unset -f action
# # unset -f apply_cmssw_customization_steps
