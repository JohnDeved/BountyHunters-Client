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

switch (true) do {
    // every .5 seconds
    case (heapCount == 5): {
        ["Heap_functions"] call misc_fnc_autoInit;
    };
    default {};
};

sleep .1;
