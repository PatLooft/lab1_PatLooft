// Pat Looft
// CIS 3513 Lab 1 - Pico, Fermi, Bagel
//
// Bagels.swift
//
// Lab 1 - Pico, Fermi, Bagel
//  1. The computer will generate a "secret" three digit number at random.
//  2. The first number will not be 0, and all the digits will be different.
//  3. The user tries to guess the number.
//      - If the user guesses correctly, then the game is over.
//      - If not, the computer gives a hint and the player tries again.


//  Bagels class should have 4 methods
//      - playGame()
//      - generateSecretNumber()
//      - isGuessCorrect(guess: String) -> Bool
//      - printHint(guess: String)

// Your Bagels class will have only one public method, playGame().
// This method will call three other methods to:
//      1. Generate the secret number
//      2. Determine whether the current guess is a winner
//      3. Evaluate the current guess and print hints
import Foundation

public class Bagels {
    var number: Int?;
    var ones: Int?;
    var tens: Int?;
    var hundos: Int?;
    

    var correct: Bool;
    // DO NOT MODIFY THE METHOD DECLARATIONS IN ANY WAY
    init(){
        self.correct = false;
//        self.ones = 1;
//        self.tens = 10;
//        self.hundos = 100;
        self.generateSecretNumber();
		self.hundos = number!/100;
		self.tens = (number!/10)%10;
		self.ones = number!%10;
    }
    
    // the ONLY public method
    public func playGame(){
        // read user input
		var input: Int;
		var playAgain: Bool;
		playAgain = true;
		input = -1;
		
		while !playAgain{
			while !correct{
				input = recInput();
				print("Input = \(input) \tnumber = \(number!)")
				correct = isGuessCorrect(guess: String(input));
				printHint(guess: String(input));
			}
			print("Would you like to play again? If so enter \"yes\"");
			let inp = readLine();
			if(inp == "yes"){
				playAgain = false;
			}
			correct = false;
		}
    }
    
    private func generateSecretNumber(){
        // random number generation
        self.number = Int(arc4random_uniform(1000));
        //return rand;
    }
    
    private func isGuessCorrect(guess: String) -> Bool{
		let g = Int(guess);
		if (self.number! == g){
            return true;
		}
		else{
			return false;
		}
    }
    
    private func printHint(guess: String){
		let g = Int(guess);
		let ghundos = g!/100;
		let gtens = (g!/10)%10;
		let gones = g!%10;
		let garr = [ghundos, gtens, gones];
		let arr = [hundos, tens, ones];
		var j: Int;
		var i: Int;
		i = 0;
		var str = "";
		//print("hundos = \(hundos!)\ttens = \(tens!)\tones = \(ones!)");
		//print("ghundos = \(ghundos)\tgtens = \(gtens)\tgones = \(gones)");
		while i < arr.count{
			j = i;
			if(arr[i] == garr[i]){
				str+="Fermi ";
			}
			else{
				j = 0;
				while j < garr.count{
					if(garr[i] == arr[j] && i != j){
						str+="Pico ";
						break;
					}
					j+=1;
				}
			}
			i+=1;
		}
		if str == ""{
			print("bagels");
		}
		print("\(str)")
    }
    
    func recInput() -> Int{
        print("Please enter a 3 digit number.")
        let i = Int(readLine()!)!;/*read input*/
		return i;
    }
    
}

