<?php


$years = [
    '2016',
    '2100',
    '2000',
];

function isLeap($year)
{
    if ((($year % 4 == 0) && ($year % 100 != 0)) || ($year % 400 == 0)) {
        var_dump($year . ' is a leap year');
    } else {
        var_dump($year . ' is NOT a leap year');
    }
}

foreach ($years as $y) {
    isLeap($y);
}
