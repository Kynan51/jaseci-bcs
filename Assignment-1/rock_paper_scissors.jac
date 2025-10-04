import random;
import from byllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

node rps_turn {
    has player_choice: str;
    has computer_choice: str;
    has result: str;
}


def comment_on_round(player: str, computer: str, result: str) -> str by llm();



walker RPSGame {
    has player_score: int = 0;
    has computer_score: int = 0;

    can start with `root entry;
    can play_round with `rps_turn entry;
}


with entry:__main__ {
    root spawn RPSGame();
}


impl RPSGame.start {
    visit [--> (`?rps_turn)];
}


impl RPSGame.play_round {
    player_choice = input("Enter rock/paper/scissors (or quit): ").strip().lower();

    if player_choice in {"quit", "q"} {
        print(f"Final scores — You: {self.player_score}, Computer: {self.computer_score}");
        disengage;
    }

    if not (player_choice in {"rock", "paper", "scissors"}) {
        print("Invalid choice! Try again.");
        visit [--> (`?rps_turn)];
    }

    computer_choice = random.choice(["rock", "paper", "scissors"]);

    if player_choice == computer_choice {
        result = "tie";
    } elif (
        (player_choice == "rock" and computer_choice == "scissors") or
        (player_choice == "paper" and computer_choice == "rock") or
        (player_choice == "scissors" and computer_choice == "paper")
    ) {
        result = "win";
        self.player_score += 1;
    } else {
        result = "lose";
        self.computer_score += 1;
    }

    print(f"You chose {player_choice}, Computer chose {computer_choice}");
    print(f"Result: {result}");

    print(comment_on_round(player_choice, computer_choice, result));

    print(f"Scores — You: {self.player_score}, Computer: {self.computer_score}\n");

    visit [--> (`?rps_turn)];
}
