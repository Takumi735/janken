# じゃんけん入力
def get_player_choice
  input = nil

  loop do
    puts "0(グー)1(チョキ)2(パー)3(戦わない)"
    player_input = gets.chomp

    if player_input =~ /^\d+$/
      player_choice = player_input.to_i

      if player_choice == 0 || player_choice == 1 || player_choice == 2
        input = player_choice
        break

      elsif player_choice == 3
        puts "ゲームを終了します"
        exit
      else
        puts "無効な入力です"
      end
    else
      puts "無効な入力です"
    end
  end

  return input
end

# あっち向いてホイ入力
def get_direction_choice
  input = nil

  loop do
    puts "0(上)1(右)2(下)3(左)"
    player_input = gets.chomp

    if player_input =~ /^\d+$/
      player_choice = player_input.to_i

      if player_choice >= 0 && player_choice <= 3
        input = player_choice
        break
      else
        puts "無効な入力です"
      end
    else
      puts "無効な入力です"
    end
  end

  return input
end



puts "じゃんけん..."

#じゃんけん実行
def play_janken

  computer_choice = rand(3)
  computer_hand = ["グー","チョキ","パー"][computer_choice]

  player_choice = get_player_choice
  player_hand = ["グー","チョキ","パー"][player_choice]


  puts "ホイ！"
  puts "----------------"
  puts "あなた: #{player_hand}を出しました"
  puts "相手: #{computer_hand}を出しました"
  puts "----------------"


  if computer_choice == player_choice
      puts "あいこで..."
      play_janken

  elsif
    player_choice == 0 && computer_choice == 1 ||
    player_choice == 1 && computer_choice == 2 ||
    player_choice == 2 && computer_choice == 0
  return :win

  else
    return :lose
  end
end

#あっち向いてホイ実行
def play_direction_game(outcome)

  puts "あっち向いて〜"

  computer_direction = rand(4)
  computer_direction_number = ["上", "右", "下", "左"][computer_direction]

  player_direction = get_direction_choice
  player_direction_number = ["上", "右", "下", "左"][player_direction]

  puts "あっち向いて〜"
  puts "ホイ！"
  puts "----------------"
  puts "あなた: #{player_direction_number}"
  puts "相手: #{computer_direction_number}"
  puts "----------------"

  if player_direction == computer_direction
    if outcome == :win
      puts "あなたの勝ちです！"
      exit
    else
      puts "あなたの負けです"
      exit
    end
  else
    puts "もう一度"
    end
end

loop do
  outcome = play_janken
  play_direction_game(outcome)
end
