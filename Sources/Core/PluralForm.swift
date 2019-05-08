//
//  PluralForm.swift
//  Dupnium
//
//  Created by Bas van Kuijck on 18-08-16.
//
//

import Foundation

class PluralForm {
	
	enum Category : String {
		case few
		case one
		case two
		case zero
		case many
		case other
	}
	
	static func getForm(_ language: String, n: Double) -> Category {
		switch language {
		case "shi":
			if n >= 2 && n <= 10 {
				return .few
			} else if n >= 0 && n <= 1 {
				return .one
			}
			
		case "kab", "ff", "fr":
			if n >= 0 && n <= 1 {
				return .one
			}
			
			
		case "lt":
			if (((n.truncatingRemainder(dividingBy: 10)) == 1) && (((n.truncatingRemainder(dividingBy: 100)) < 11 || (n.truncatingRemainder(dividingBy: 100)) > 19))) {
				return .one
			}
			if ((((n.truncatingRemainder(dividingBy: 10)) >= 2 && (n.truncatingRemainder(dividingBy: 10)) <= 9)) && (((n.truncatingRemainder(dividingBy: 100)) < 11 || (n.truncatingRemainder(dividingBy: 100)) > 19))) {
				return .few
			}
			
		case "lv":
			if (n == 0) {
				return .zero
			}
			if (((n.truncatingRemainder(dividingBy: 10)) == 1) && ((n.truncatingRemainder(dividingBy: 100)) != 11)) {
				return .one
			}
			
		case "cy":
			if (n == 0) {
				return .zero
			}
			if (n == 1) {
				return .one
			}
			if (n == 2) {
				return .two
			}
			if (n == 3) {
				return .few
			}
			if (n == 6) {
				return .many
			}
			
		case "be", "bs", "hr", "ru", "sh", "sr", "uk":
			if (((n.truncatingRemainder(dividingBy: 10)) == 1) && ((n.truncatingRemainder(dividingBy: 100)) != 11)) {
				return .one
			}
			if ((((n.truncatingRemainder(dividingBy: 10)) >= 2 && (n.truncatingRemainder(dividingBy: 10)) <= 4)) && (((n.truncatingRemainder(dividingBy: 100)) < 12 || (n.truncatingRemainder(dividingBy: 100)) > 14))) {
				return .few
			}
			if (((n.truncatingRemainder(dividingBy: 10)) == 0) || (((n.truncatingRemainder(dividingBy: 10)) >= 5 && (n.truncatingRemainder(dividingBy: 10)) <= 9)) || (((n.truncatingRemainder(dividingBy: 100)) >= 11 && (n.truncatingRemainder(dividingBy: 100)) <= 14))) {
				return .many
			}
			
		case "ksh":
			if (n == 0) {
				return .zero
			}
			if (n == 1) {
				return .one
			}
			
		case "he":
			if (n == 2) {
				return .two
			}
			if (n == 1) {
				return .one
			}
			if ((n != 0) && ((n.truncatingRemainder(dividingBy: 10)) == 0)) {
				return .many
			}
			
		case "cs", "sk":
			if (n == 1) {
				return .one
			}
			if ((n >= 2 && n <= 4)) {
				return .few
			}
			
		case "br":
			if ((n != 0) && ((n.truncatingRemainder(dividingBy: 1000000)) == 0)) {
				return .many
			}
			if (((n.truncatingRemainder(dividingBy: 10)) == 1) && (((n.truncatingRemainder(dividingBy: 100)) != 11) && ((n.truncatingRemainder(dividingBy: 100)) != 71) && ((n.truncatingRemainder(dividingBy: 100)) != 91))) {
				return .one
			}
			if (((n.truncatingRemainder(dividingBy: 10)) == 2) && (((n.truncatingRemainder(dividingBy: 100)) != 12) && ((n.truncatingRemainder(dividingBy: 100)) != 72) && ((n.truncatingRemainder(dividingBy: 100)) != 92))) {
				return .two
			}
			if ((((n.truncatingRemainder(dividingBy: 10)) >= 3 && (n.truncatingRemainder(dividingBy: 10)) <= 4) || ((n.truncatingRemainder(dividingBy: 10)) == 9)) && (((n.truncatingRemainder(dividingBy: 100)) < 10 || (n.truncatingRemainder(dividingBy: 100)) > 19) && ((n.truncatingRemainder(dividingBy: 100)) < 70 || (n.truncatingRemainder(dividingBy: 100)) > 79) && ((n.truncatingRemainder(dividingBy: 100)) < 90 || (n.truncatingRemainder(dividingBy: 100)) > 99))) {
				return .few
			}
			
		case "sl":
			if ((n.truncatingRemainder(dividingBy: 100)) == 2) {
				return .two
			}
			if ((n.truncatingRemainder(dividingBy: 100)) == 1) {
				return .one
			}
			if (((n.truncatingRemainder(dividingBy: 100)) >= 3 && (n.truncatingRemainder(dividingBy: 100)) <= 4)) {
				return .few
			}
			
		case "lag":
			if (n == 0)  {
				return .zero
			}
			if (((n >= 0 && n <= 2)) && (n != 0) && (n != 2)) {
				return .one
			}
			
		case "pl":
			if (n == 1) {
				return .one
			}
			if ((((n.truncatingRemainder(dividingBy: 10)) >= 2 && (n.truncatingRemainder(dividingBy: 10)) <= 4)) && (((n.truncatingRemainder(dividingBy: 100)) < 12 || (n.truncatingRemainder(dividingBy: 100)) > 14))) {
				return .few
			}
			if (((n != 1) && (((n.truncatingRemainder(dividingBy: 10)) >= 0 && (n.truncatingRemainder(dividingBy: 10)) <= 1))) || (((n.truncatingRemainder(dividingBy: 10)) >= 5 && (n.truncatingRemainder(dividingBy: 10)) <= 9)) || (((n.truncatingRemainder(dividingBy: 100)) >= 12 && (n.truncatingRemainder(dividingBy: 100)) <= 14))) {
				return .many
			}
			
		case "gd":
			if ((n == 2) || (n == 12)) {
				return .two
			}
			if ((n == 1) || (n == 11)) {
				return .one
			}
			if ((n >= 3 && n <= 10) || (n >= 13 && n <= 19)) {
				return .few
			}
			
		case "gv":
			if ((((n.truncatingRemainder(dividingBy: 10)) >= 1 && (n.truncatingRemainder(dividingBy: 10)) <= 2)) || ((n.truncatingRemainder(dividingBy: 20)) == 0))  {
				return .one
			}
			
		case "mk":
			if (((n.truncatingRemainder(dividingBy: 10)) == 1) && (n != 11)) {
				return .one
			}
			
		case "mt":
			if (n == 1) {
				return .one
			}
			if (((n.truncatingRemainder(dividingBy: 100)) >= 11 && (n.truncatingRemainder(dividingBy: 100)) <= 19)) {
				return .many
			}
			if ((n == 0) || (((n.truncatingRemainder(dividingBy: 100)) >= 2 && (n.truncatingRemainder(dividingBy: 100)) <= 10))) {
				return .few
			}
			
		case "mo", "ro":
			if (n == 1) {
				return .one
			}
			if ((n == 0) || ((n != 1) && (((n.truncatingRemainder(dividingBy: 100)) >= 1 && (n.truncatingRemainder(dividingBy: 100)) <= 19)))) {
				return .few
			}
			
		case "ga":
			if (n == 2) {
				return .two
			}
			if (n == 1) {
				return .one
			}
			if ((n >= 3 && n <= 6)) {
				return .few
			}
			if ((n >= 7 && n <= 10)) {
				return .many
			}
			
		case "iu", "kw", "se", "naq", "sma", "smi", "smj", "smn", "sms":
			if (n == 2) {
				return .two
			}
			if (n == 1) {
				return .one
			}
			
		case "ak", "am", "bh", "hi", "ln", "mg", "ti", "tl", "wa", "fil", "guw", "nso":
			if ((n >= 0 && n <= 1)) {
				return .one
			}
			
		case "tzm":
			if ((n >= 0 && n <= 1) || (n >= 11 && n <= 99)) {
				return .one
			}

        case "nl":
            if (n == 1 || floor(n) != n) {
                return .one
            }

		case "af", "bg", "bn", "ca", "da", "de", "dv", "ee", "el", "en", "eo", "es", "et", "eu", "fi", "fo", "fy", "gl", "gu", "ha", "is", "it", "kk", "kl", "ks", "ku", "ky", "lb", "lg", "ml", "mn", "mr", "nb", "nd", "ne", "nn", "no", "nr", "ny", "om", "or", "os", "pa", "ps", "pt", "rm", "sn", "so", "sq", "ss", "st", "sv", "sw", "a", "te", "tk", "tn", "ts", "ur", "ve", "vo", "vx", "zu", "asa", "ast", "bem", "bez", "brx", "cgg", "chr", "ckb", "fur", "gsw", "haw", "jgo", "jmc", "kaj", "kcg", "kkj", "ksb", "mas", "mgo", "nah", "nnh", "nyn", "pap", "rof", "rwk", "saq", "seh", "ssy", "syr", "tig", "vun", "wae", "xog":
			if (n == 1) {
				return .one
			}
			
		case "ar":
			if (n == 2) {
				return .two
			}
			if (n == 1) {
				return .one
			}
			if (n == 0) {
				return .zero
			}
			if (((n.truncatingRemainder(dividingBy: 100)) >= 3 && (n.truncatingRemainder(dividingBy: 100)) <= 10)) {
				return .few
			}
			if (((n.truncatingRemainder(dividingBy: 100)) >= 11 && (n.truncatingRemainder(dividingBy: 100)) <= 99)) {
				return .many
			}
			
		default:
			break
		}
		return .other
	}
}
