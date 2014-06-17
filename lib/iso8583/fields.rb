module ISO8583

  # This file contains a number of preinstantiated Field definitions. You
  # will probably need to create own fields in your implementation, please
  # see Field and Codec for further discussion on how to do this.
  # The fields currently available are those necessary to implement the 
  # spec of banks.
  #
  # The following field types are available:
  #
  # [LLVAR_N]      two byte variable length ASCII numeral, payload ASCII numerals
  # [LLVAR_ANS]    two byte variable length ASCII numeral, payload ASCII
  # [ANS]            fixed length letters, represented in ASCII
  # [N]            fixed lengh numerals, repesented in ASCII, padding right justified using zeros
  # [B]            binary data, padding left using nulls (0x00)
  # [YYYYMMDDHH]   Date, formatted as described in ASCII numerals
  # [YYYYMMDDHH24MISS] Date, formatted as named in ASCII numerals

  # Special form to de/encode variable length indicators, two bytes ASCII numerals
  LL         = Field.new
  LL.name    = "LL"
  LL.length  = 2
  LL.codec   = ASCII_Number
  LL.padding = lambda {|value|
    sprintf("%02d", value)
  }

  # Special form to de/encode variable length indicators, three bytes ASCII numerals
  LLL         = Field.new
  LLL.name    = "LLL"
  LLL.length  = 3
  LLL.codec   = ASCII_Number
  LLL.padding = lambda {|value|
    sprintf("%03d", value)
  }

  # Two byte variable length ASCII numeral, payload ASCII numerals
  LLVAR_N        = Field.new
  LLVAR_N.length = LL
  LLVAR_N.codec  = ASCII_Number

  # Two byte variable length alpha-numeric with special characters.
  LLVAR_ANS      = Field.new
  LLVAR_ANS.length = LL
  LLVAR_ANS.codec = ANS_Codec

  # Three byte variable length ASCII numeral, payload ASCII+special
  LLLVAR_ANS        = Field.new
  LLLVAR_ANS.length = LLL
  LLLVAR_ANS.codec  = ANS_Codec

  # Two byte variable length ASCII letters
  # Fixed lengh numerals, repesented in ASCII, padding right justified using zeros
  N = Field.new
  N.codec = ASCII_Number
  N.padding = lambda {|val, len|
    sprintf("%0#{len}d", val)
  }

  PADDING_LEFT_JUSTIFIED_SPACES = lambda {|val, len|
    sprintf "%-#{len}s", val
  }

  # Fixed length ASCII letters [A-Za-z]
  ANS = Field.new
  ANS.codec = ANS_Codec
  ANS.padding = PADDING_LEFT_JUSTIFIED_SPACES

  # Binary data, padding left using nulls (0x00)
  B = Field.new
  B.codec = Null_Codec
  B.padding = lambda {|val, len|
    while val.length < len
      val = val + "\000"
    end
    val
  }

  # Date, formatted as described in Bankaway
  YYYYMMDDHH        = Field.new
  YYYYMMDDHH.codec  = YYYYMMDDHHcodec
  YYYYMMDDHH.length = 8

  #Date, formatted as described in Bankaway
  YYYYMMDDHH24MISS        = Field.new
  YYYYMMDDHH24MISS.codec  = YYYYMMDDHH24MISScodec
  YYYYMMDDHH24MISS.length = 14

end
