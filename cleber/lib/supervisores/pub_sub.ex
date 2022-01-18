defmodule Supervisor.PubSub do
  
  alias Phoenix.PubSub

  @valid_classes ~w(teste msgxD)

  def subscribe(topic = <<class::binary-size(5), ?:>> <> _) when class in @valid_classes do
    PubSub.subscribe(__MODULE__, topic)
  end

  def broadcast(
        topic = <<class::binary-size(5), ?:>> <> _,
        message = %_{}
    ) when class in @valid_classes do
    PubSub.broadcast(__MODULE__, topic, {topic, message})
  end

  def unsubscribe(topic = <<class::binary-size(5), ?:>> <> _) when class in @valid_classes do
    PubSub.unsubscribe(__MODULE__, topic)
  end
end
