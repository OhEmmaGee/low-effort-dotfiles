#!/usr/bin/env bash

core_usr() {
    ACTUAL_CORE_NUMBER=$(( $2 + 4 ))
    PRINT="{print \$$1}"
    mpstat -P ALL -u | awk "$PRINT" | sed -n "$ACTUAL_CORE_NUMBER"p
}

inuse() {
    ACTUAL_CORE_NUMBER=$(( $2 + 4 ))

    USR=$(core_usr 4 $ACTUAL_CORE_NUMBER)
    NICE=$(core_usr 5 $ACTUAL_CORE_NUMBER)
    SYS=$(core_usr 6 $ACTUAL_CORE_NUMBER)
    IOWAIT=$(core_usr 7 $ACTUAL_CORE_NUMBER)
    IRQ=$(core_usr 8 $ACTUAL_CORE_NUMBER)
    SOFT=$(core_usr 9 $ACTUAL_CORE_NUMBER)
    STEAL=$(core_usr 10 $ACTUAL_CORE_NUMBER)
    GUEST=$(core_usr 11 $ACTUAL_CORE_NUMBER)
    GNICE=$(core_usr 12 $ACTUAL_CORE_NUMBER)

    TOTAL=$(echo "$USR" + "$NICE" + "$SYS" + "$IOWAIT" + "$IRQ" + "$SOFT" + "$STEAL" + "$GUEST" + "$GNICE" | bc)
    echo "$TOTAL"
}

case "$1" in 
    --usr)
        if [[ "$2" -le 12 && "$2" -ge 1 ]]; then
            core_usr 4 "$2"
        elif [[ "$2" == "--all" ]]; then
            core_usr 4 0
        else
            echo Invalid core value!
        fi
        ;;
    --nice)
        if [[ "$2" -le 12 && "$2" -ge 1 ]]; then
            core_usr 5 "$2"
        elif [[ "$2" == "--all" ]]; then
            core_usr 5 0
        else
            echo Invalid core value!
        fi
        ;;
    --sys)   
        if [[ "$2" -le 12 && "$2" -ge 1 ]]; then
            core_usr 6 "$2"
        elif [[ "$2" == "--all" ]]; then
            core_usr 6 0
        else
            echo Invalid core value!
        fi
        ;;
    --iowait)
        if [[ "$2" -le 12 && "$2" -ge 1 ]]; then
            core_usr 7 "$2"
        elif [[ "$2" == "--all" ]]; then
            core_usr 7 0
        else
            echo Invalid core value!
        fi
        ;;
    --irq)
        if [[ "$2" -le 12 && "$2" -ge 1 ]]; then
            core_usr 8 "$2"
        elif [[ "$2" == "--all" ]]; then
            core_usr 8 0
        else
            echo Invalid core value!
        fi
        ;;
    --soft)
        if [[ "$2" -le 12 && "$2" -ge 1 ]]; then
            core_usr 9 "$2"
        elif [[ "$2" == "--all" ]]; then
            core_usr 9 0
        else
            echo Invalid core value!
        fi
        ;;
    --steal)
        if [[ "$2" -le 12 && "$2" -ge 1 ]]; then
            core_usr 10 "$2"
        elif [[ "$2" == "--all" ]]; then
            core_usr 10 0
        else
            echo Invalid core value!
        fi
        ;;
    --guest)
        if [[ "$2" -le 12 && "$2" -ge 1 ]]; then
            core_usr 11 "$2"
        elif [[ "$2" == "--all" ]]; then
            core_usr 11 0
        else
            echo Invalid core value!
        fi
        ;;
    --gnice)
        if [[ "$2" -le 12 && "$2" -ge 1 ]]; then
            core_usr 12 "$2"
        elif [[ "$2" == "--all" ]]; then
            core_usr 12 0
        else
            echo Invalid core value!
        fi
        ;;
    --idle)
        if [[ "$2" -le 12 && "$2" -ge 1 ]]; then
            core_usr 13 "$2"
        elif [[ "$2" == "--all" ]]; then
            core_usr 13 0
        else
            echo Invalid core value!
        fi
        ;;
    --inuse)
        if [[ "$2" -le 12 && "$2" -ge 1 ]]; then
            inuse "$2"
        elif [[ "$2" == "--all" ]]; then
            inuse 0
        else
            echo Invalid core value!
        fi
        ;;
    *)
        echo Invalid choice!
        ;;
esac

# vim:ft=bash:nowrap
