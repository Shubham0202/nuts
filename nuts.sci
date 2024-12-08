function [sortedNuts, sortedBolts] = matchNutsBolts(nuts, bolts)
    if length(nuts) <= 1 then
        sortedNuts = nuts;
        sortedBolts = bolts;
        return;
    end

    pivotNut = nuts(1); // Choose the first nut as the pivot
    [lessBolts, equalBolt, greaterBolts] = partitionBolts(bolts, pivotNut);
    [lessNuts, equalNut, greaterNuts] = partitionNuts(nuts, equalBolt);

    [sortedLessNuts, sortedLessBolts] = matchNutsBolts(lessNuts, lessBolts);
    [sortedGreaterNuts, sortedGreaterBolts] = matchNutsBolts(greaterNuts, greaterBolts);

    sortedNuts = [sortedLessNuts, equalNut, sortedGreaterNuts];
    sortedBolts = [sortedLessBolts, equalBolt, sortedGreaterBolts];
end

function [less, equal, greater] = partitionBolts(bolts, nut)
    less = [];
    equal = [];
    greater = [];
    for bolt = bolts
        if bolt < nut then
            less = [less, bolt];
        elseif bolt == nut then
            equal = bolt;
        else
            greater = [greater, bolt];
        end
    end
end

function [less, equal, greater] = partitionNuts(nuts, bolt)
    less = [];
    equal = [];
    greater = [];
    for nut = nuts
        if nut < bolt then
            less = [less, nut];
        elseif nut == bolt then
            equal = nut;
        else
            greater = [greater, nut];
        end
    end
end

nuts = [5, 3, 1, 4, 2];
bolts = [3, 5, 2, 1, 4];

[sortedNuts, sortedBolts] = matchNutsBolts(nuts, bolts);
disp("Sorted Nuts: "), disp(sortedNuts);
disp("Sorted Bolts: "), disp(sortedBolts);


