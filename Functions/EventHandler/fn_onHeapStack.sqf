if (heapCount >= 10) then {
    heapCount = 0;
} else {
    heapCount = heapCount + 1;
};

// every .1 seconds
if (idleLoadingCount >= 11) then {
    idleLoadingCount = 0;
} else {
    idleLoadingCount = idleLoadingCount + 1;
};
onKeydownCooldown = false;

if (heapCount == 5) then {
    // every .5 seconds
    ["Heap_functions"] call misc_fnc_autoInit;
};

sleep .1;
