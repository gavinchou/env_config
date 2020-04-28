-- Do Not Edit This File.
-- [32] = default; [33] = line number; [34] = brace highlight; [35] = unmatched brace
return {
	common = {
		style = {
			-- cursor line
			caret = {
				back = "#3c3d37"
			},
			comment = {
				fore = "#00e000"
			},
			docComment = {
				fore = "#00e000"
			},
			docKeyword = {
				fore = "#00e000"
			},
			doubleQuotedString = {
				fore = "#df5f00"
			},
			error = {
				back = "#ff0000",
				eolfilled = true,
				fore = "#ffff00"
			},
			find = {
				fore = "#000000",
				back = "#ffff00"
			},
			foldMargin = {
				back = "#3c3d37"
			},
			identifier = {
				fore = "#66d9ef"
			},
			inactive = {
				back = "#888888",
				eolfilled = true
			},
			keyword = {
				fore = "#f92672"
			},
			label = {
				fore = "#e6db74"
			},
			number = {
				fore = "#ae81ff"
			},
			operator = {
-- this will afect all operator including scope operator and semicolon
-- 				fore = "#f92672"
			},
			preprocessor = {
				fore = "#f92672"
			},
			ref = {
				underline = true
			},
			selection = {
				back = "#3c3d37",
				eolfilled = true
			},
			singleQuotedString = {
				fore = "#df5f00"
			},
			unclosedDoubleQuotedString = {
				eolfilled = true,
				fore = "#df5f00"
			},
			unclosedSingleQuotedString = {
				eolfilled = true,
				fore = "#df5f00"
			},
			whitespace = {
				fore = "#808080"
			}
		}
	},
	style = {
		-- default
		[32] = {
			back = "#202020",
			fore = "#eeeeee"
		},
		-- line number
		[33] = {
			fore = "#888888",
			back = "#3c3d37",
		},
		-- brace highlight
		[34] = {
			fore = "#f92672"
		},
		-- unmatch brace
		[35] = {
			back = "#ff0000"
		}
	},
	udb = {
		style = {
			ada = {
				globalVariableNames = {
					bold = true,
					fore = "#003366"
				},
				localVariableNames = {
					fore = "#003366",
					italic = true
				},
				subprogramNames = {
					fore = "#800000"
				},
				typeNames = {
					underline = true
				}
			},
			cs = {
				classNames = {
					underline = true
				},
				enumeratorNames = {
					fore = "#0080ff"
				},
				methodNames = {
					fore = "#800000"
				},
				typeNames = {
					underline = true
				}
			},
			cxx = {
				classNames = {
					fore = "#66d9ef"
				},
				enumeratorNames = {
					fore = "#66d9ef"
				},
				functionNames = {
					fore = "#a6e22e"
				},
				globalVariableNames = {
					fore = "#ff0000"
				},
				localVariableNames = {
					fore = "#f8f8f2"
				},
				macroNames = {
					fore = "#ae81ff"
				},
				memberFunctionNames = {
					fore = "#a6e22e"
				},
				memberVariableNames = {
					fore = "#eeeeee"
				},
				namespaceNames = {
					fore = "#52d8ff"
				},
				parameterNames = {
					fore = "#fc841a"
				},
				virtualFunctionNames = {
					fore = "#52e3f6"
				}
			},
			fortran = {
				subprogramNames = {
					fore = "#800000"
				},
				typeNames = {
					underline = true
				}
			},
			java = {
				classNames = {
					underline = true
				},
				interfaceNames = {
					underline = true
				},
				methodNames = {
					fore = "#800000"
				}
			},
			jovial = {
				subroutineNames = {
					fore = "#800000"
				},
				typeNames = {
					underline = true
				}
			},
			pascal = {
				routineNames = {
					fore = "#800000"
				},
				typeNames = {
					underline = true
				}
			},
			python = {
				classNames = {
					underline = true
				},
				functionNames = {
					fore = "#800000"
				}
			},
			vhdl = {
				processNames = {
					fore = "#800000"
				},
				subprogramNames = {
					fore = "#800000"
				},
				typeNames = {
					underline = true
				}
			}
		}
	}
}