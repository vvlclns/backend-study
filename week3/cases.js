const factorial = (number) => {
    let result = 1;
    for (let i = 0; i < number; i++) result *= i + 1;
    return result;
};

const permutation = (n, r) => factorial(n) / factorial(n - r);
const combination = (n, r) => permutation(n, r) / factorial(r);
const multiPermutation = (n, r) => n ** r;
const multiCombination = (n, r) => combination(n + r - 1, r);

// function permutation(n, r) {
//     // n! / (n - r)!
//     let k = n - r;
//     let numerator = 1;
//     let denominator = 1;

//     while (n > 0) {
//         numerator = numerator * n;
//         n--;
//     }
//     while (k > 0) {
//         denominator = denominator * k;
//         k--;
//     }

//     let result = numerator / denominator;
//     return result;
// }


// function combination(n, r) {
//     // n! / (n - r)! * r!
//     let k = n - r;
//     let numerator = 1;
//     let denominator1 = 1;
//     let denominator2 = 1;

//     while (n > 0) {
//         numerator = numerator * n;
//         n--;
//     }
//     while (r > 0) {
//         denominator1 = denominator1 * r;
//         r--;
//     }
//     while (k > 0) {
//         denominator2 = denominator2 * k;
//         k--;
//     }

//     let result = numerator / (denominator1 * denominator2);
//     return result;
// }

// function multiPermutation(n, r) {
//     // n^r
//     let result = 1;

//     while (r > 0) {
//         result = result * n;
//         r--;
//     }

//     return result;
// }

// function multiCombination(n, r) {
//     // (n + r - 1)! / (n - 1)! * r!
//     let k = n + r - 1;
//     let numerator = 1;
//     let denominator1 = 1;
//     let denominator2 = 1;

//     while (k > 0) {
//         numerator = numerator * k;
//         k--;
//     }
//     while (n > 1) {
//         denominator1 = denominator1 * (n - 1);
//         n--;
//     }
//     while (r > 0) {
//         denominator2 = denominator2 * r;
//         r--;
//     }
    
//     let result = numerator / (denominator1 * denominator2);
//     return result;
// }

module.exports.permutation = permutation;
module.exports.combination = combination;
module.exports.multiPermutation = multiPermutation;
module.exports.multiCombination = multiCombination;