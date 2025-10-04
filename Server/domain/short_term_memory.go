package domain

type ShortTermMemory int

const (
	STMUnknown ShortTermMemory = iota
	STMBad
	STMNormal
	STMGood
	STMPerfect
)

func (s ShortTermMemory) String() string {
	switch s {
	case STMBad:
		return "Bad"
	case STMNormal:
		return "Normal"
	case STMGood:
		return "Good"
	case STMPerfect:
		return "Perfect"
	default:
		return "Unknown"
	}
}
