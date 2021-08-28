function sum(...args){
    let sum = 0; 
    args.forEach (num => {
        sum += num; 
    });

    return sum; 
}

class Cat {
    constructor(name) {
      this.name = name;
    }
  
    says(sound, person) {
      console.log(`${this.name} says ${sound} to ${person}!`);
      return true;
    }
  }
  
  class Dog {
    constructor(name) {
      this.name = name;
    }
  }

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");
//markov.says("meow", "Ned");

Function.prototype.myBind = function(context){
    let that = this; 
    return function(){
        return that.apply(context, arguments);
    }
};

// no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
//notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true


// Function.prototype.curry = function(numArgs){
//     let sum = []; 

//     return add = function (num) {
//         sum.push(num);
//         if (sum.length < numArgs){
//             return add;
//         } else {
//             return sumThree(...sum);
//         }
//     }

// }

function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
}
  
sumThree(4, 20, 6);
// // you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// console.log(sumThree.curry(3)(4)(20)(6));

// Function.prototype.curriedSum = function(numArgs){
//     let curArgs = 0; 
//     let sum = 0; 

//     return add = function (num) {
//         sum += num;
//         curArgs++;
//         if (curArgs < numArgs){
//             return add;
//         } else {
//             return sum;
//         }
//     }

//}


// f1 = sumThree.curriedSum(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30
//console.log(sumThree.curriedSum(3)(4)(20)(6));

Function.prototype.curry = function(numArgs){
    let args = [];
    let that = this;
    return _curry = function (arg) {
        args.push(arg);
        if (args.length < numArgs){
            return _curry;
        } else {
            return that.apply(that, args);
        }
    }
}

console.log(sumThree.curry(3)(4)(20)(6));