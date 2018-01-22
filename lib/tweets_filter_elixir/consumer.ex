defmodule TweetsFilterElixir.Consumer do

  use GenStage

  alias TweetsFilterElixir.Producer
	def start_link do
		GenStage.start_link(__MODULE__, [])
	end

	def init(tweets) do
		IO.puts "Start consumer.."
		{:consumer, tweets, subscribe_to: [{Producer, max_demand: 200, min_demand: 150}]}
	end

  def handle_events(events, _from, _tweets) do
    new_tweets = events |> Enum.map(fn e -> e.text end)
		new_tweets |> Enum.each(fn t -> IO.inspect([self(),"#{:os.system_time}: #{t}"]) end)

		IO.inspect [self(),"sleeping for 10s"]
		:timer.sleep(10_000)
		IO.inspect [self(),"awake"]

		{:noreply, [], nil}
  end
end
