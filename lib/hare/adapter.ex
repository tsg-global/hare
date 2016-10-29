defmodule Hare.Adapter do
  @moduledoc """
  Specification of the AMQP adapter
  """

  @type opts :: Keyword.t

  # Connection
  #
  @type conn :: term

  @callback open_connection(config :: term) ::
              {:ok, conn} | {:error, term}

  @callback monitor_connection(conn) ::
              reference

  @callback close_connection(conn) ::
              :ok

  # Channel
  #
  @type chan :: term

  @callback open_channel(conn) ::
              {:ok, chan} | {:error, term}

  @callback monitor_channel(chan) ::
              reference

  @callback link_channel(chan) ::
              true

  @callback unlink_channel(chan) ::
              true

  @callback close_channel(chan) ::
              :ok

  # Declare
  #
  @type exchange :: binary
  @type queue    :: binary

  @callback declare_exchange(chan, exchange, type :: atom, opts) ::
              :ok | {:error, reason :: term}

  @callback declare_queue(chan, queue, opts) ::
              {:ok, info :: term} | {:error, term}

  @callback declare_server_named_queue(chan, opts) ::
              {:ok, queue, info :: term} | {:error, term}

  @callback bind(chan, queue, exchange, opts) ::
              :ok

  @callback unbind(chan, queue, exchange, opts) ::
              :ok

  # Publish
  #
  @type payload     :: binary
  @type routing_key :: binary

  @callback publish(chan, exchange, payload, routing_key, opts) ::
              :ok

  # Get
  #
  @type meta :: map

  @callback get(chan, queue, opts) ::
              {:empty, info :: map} | {:ok, payload, meta}

  @callback ack(chan, meta, opts) ::
              :ok

  @callback nack(chan, meta, opts) ::
              :ok

  @callback reject(chan, meta, opts) ::
              :ok
end
