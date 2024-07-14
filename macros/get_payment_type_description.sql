{#
    This macro returns the description of the payment_type 
#}

{% macro get_payment_type_description(payment_type) -%}

    case 
        when {{ payment_type }} is null then 'Voided trip'
        when {{ payment_type }} is not null then
            case cast(PARSE_NUMERIC({{ payment_type }}) as integer)
                when 1 then 'Credit card'
                when 2 then 'Cash'
                when 3 then 'No charge'
                when 4 then 'Dispute'
                when 5 then 'Unknown'
                when 0 then 'Voided trip'
            end
    end

{%- endmacro %}