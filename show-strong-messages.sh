#!/bin/bash
grep -sh . /run/{dump1090-fa,readsb}/stats.json | jq '.total.local | ((.accepted | add), .strong_signals, .signal, .noise)' | xargs -n4 echo | awk '{printf "\nPercentage of strong messages: %.3f\nSignal: %.1f\nNoise: %.1f\n", $(2) * 100 / $(1), $(3), $(4)}'
