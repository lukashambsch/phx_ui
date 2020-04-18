defmodule PhxUi.FormHelpers do
  @moduledoc """
  Conveniences for custom form fields.
  """

  alias Phoenix.HTML

  @input_class "shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
  @label_class "block text-gray-700 text-sm font-bold mb-2"
  @form_class "bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4"
  @button_class "bg-blue-500 hover:bg-blue-700 text-white tracking-wide py-2 px-4 rounded focus:outline-none focus:shadow-outline"

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
    HTML.Tag.content_tag :div, class: "mb-4" do
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
    HTML.Tag.content_tag :div, class: "mb-4" do
      [
        label(form, field),
        password_input(form, field),
        PhxUi.ErrorHelpers.error_tag(form, field)
      ]
    end
  end

  @spec submit(String.t(), Keyword.t()) :: HTML.safe()
  def submit(label, options \\ []) do
    HTML.Form.submit(label, build_options(options, class: @button_class))
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
