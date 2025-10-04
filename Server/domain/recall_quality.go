package domain

type RecallQuality int

const (
	Bad     RecallQuality = 1
	Normal  RecallQuality = 2
	Good    RecallQuality = 3
	Perfect RecallQuality = 4
)

func (q RecallQuality) String() string {
	switch q {
	case Bad:
		return "Bad"
	case Normal:
		return "Normal"
	case Good:
		return "Good"
	case Perfect:
		return "Perfect"
	default:
		return "Invalid"
	}
}
