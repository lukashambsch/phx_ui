defmodule PhxUi.FormHelpers do
  @moduledoc """
  Conveniences for custom form fields.
  """

  alias Phoenix.HTML

  @input_class "shadow appearance-none border rounded w-full py-2 px-3 text-gray-800 leading-tight focus:outline-none focus:shadow-outline"
  @label_class "block text-gray-800 text-sm mb-2"
  @form_class "bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4"
  @button_class "disabled:opacity-50 tracking-wide py-2 px-4 rounded focus:outline-none focus:shadow-outline shadow-360"

  @spec form_for(HTML.FormData.t(), String.t(), Keyword.t()) :: HTML.Form.t()
  def form_for(form_data, action, options \\ []) do
    options = build_options(options, class: @form_class)
    HTML.Form.form_for(form_data, action, options)
  end

  @spec label(HTML.FormData.t(), HTML.Form.field(), Keyword.t()) :: HTML.safe()
  def label(form, field, options \\ []) do
    options = build_options(options, class: @label_class)
    HTML.Form.label(form, field, options)
  end

  @spec text_input(HTML.Form.t(), HTML.Form.field(), Keyword.t()) :: HTML.safe()
  def text_input(form, field, options \\ []) do
    options = build_options(options, class: @input_class)
    HTML.Form.text_input(form, field, options)
  end

  @spec password_input(HTML.Form.t(), HTML.Form.field(), Keyword.t()) :: HTML.safe()
  def password_input(form, field, options \\ []) do
    options = build_options(options, class: @input_class)
    HTML.Form.password_input(form, field, options)
  end

  @spec text_input_group(HTML.Form.t(), HTML.Form.field()) :: HTML.safe()
  def text_input_group(form, field) do
    HTML.Tag.content_tag :div, class: "w-full mb-2" do
      [
        label(form, field),
        text_input(form, field),
        PhxUi.ErrorHelpers.error_tag(form, field)
      ]
    end
  end

  @spec password_input_group(HTML.Form.t(), HTML.Form.field()) ::
          HTML.safe()
  def password_input_group(form, field) do
    HTML.Tag.content_tag :div, class: "w-full mb-2" do
      [
        label(form, field),
        password_input(form, field),
        PhxUi.ErrorHelpers.error_tag(form, field)
      ]
    end
  end

  @spec submit(String.t(), Keyword.t()) :: HTML.safe()
  def submit(label, options \\ []) do
    class = add_colors_to_class(@button_class, options)

    HTML.Form.submit(label, build_options(options, class: class))
  end

  @spec button(String.t(), Keyword.t()) :: HTML.safe()
  def button(label, options \\ []) do
    class = add_colors_to_class(@button_class, options)

    HTML.Form.submit(label, build_options(options, class: class))
  end

  @spec add_colors_to_class(String.t(), Keyword.t()) :: String.t()
  defp add_colors_to_class(class, options) do
    {bg_color, options} = Keyword.pop(options, :bg, "green")
    {text_color, options} = Keyword.pop(options, :text, "white")

    "#{class} bg-#{bg_color}-500 hover:bg-#{bg_color}-700 text-#{text_color} #{
      Keyword.get(options, :class, "")
    }"
  end

  @spec build_options(Keyword.t(), Keyword.t()) :: Keyword.t()
  defp build_options(custom, default) do
    Keyword.merge(custom, default) |> Keyword.put(:class, build_class(custom, default))
  end

  @spec build_class(Keyword.t(), Keyword.t()) :: String.t()
  defp build_class([class: custom_class], class: default_class) do
    [custom_class, default_class]
    |> Enum.filter(fn class_name -> String.length(class_name) > 0 end)
    |> Enum.join(" ")
  end

  defp build_class(_, class: default_class), do: default_class
  defp build_class([class: custom_class], _), do: custom_class
end
