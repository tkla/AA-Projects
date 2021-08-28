const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback){
    reader.question(`Is ${el1} > ${el2} ? :`, function(answer) {
        if (answer === 'yes'){ 
            callback(true);
        } else {
            callback(false); 
        }
    });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortloop){
    if (i < arr.length - 1) {
        askIfGreaterThan(arr[i], arr[i+1], function(isGreaterThan){ 
            if (isGreaterThan){
                let tmp = arr[i];
                arr[i] = arr[i+1];
                arr[i+1] = tmp;
                madeAnySwaps = true; 
            }
            innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortloop);
        });
    } 
    if ( i === (arr.length) - 1){
        outerBubbleSortloop(madeAnySwaps);
    }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
        // Begin an inner loop if you made any swaps. Otherwise, call
        // `sortCompletionCallback`.
        if (madeAnySwaps){ 
            madeAnySwaps = false;
            innerBubbleSortLoop(arr, 0, madeAnySwaps, outerBubbleSortLoop);
        }else {
            sortCompletionCallback(arr);
        }
    }
  
    // Kick the first outer loop off, starting `madeAnySwaps` as true.
    outerBubbleSortLoop(true);
  }
  
  absurdBubbleSort([3, 2, 1], function(arr) {
    console.log("Sorted array: " + JSON.stringify(arr));
    reader.close();
  });