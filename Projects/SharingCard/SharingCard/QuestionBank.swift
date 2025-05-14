import SwiftUI


// MARK: - 모델
struct CategoryItem {
    let name: String
    let icon: String
    let color: Color
}


// MARK: - category Data

let categories: [CategoryItem] = [
    .init(name: "Food", icon: "fork.knife", color: .red),
    .init(name: "Sports", icon: "figure.run", color: .blue),
    .init(name: "Daily", icon: "sun.max", color: .orange),
    .init(name: "Family", icon: "house", color: .purple),
    .init(name: "Study", icon: "book", color: .green),
    .init(name: "Travel", icon: "airplane", color: .teal),
    .init(name: "Movie", icon: "film", color: .gray),
    .init(name: "Music", icon: "music.note", color: .pink)
]
// 바깥에 두게 되고 사용한다면 전체를 대상으로 하지만 데이터를 계속해서 점유하고 있게 되기 때문에
// 많아지게 된다면 데이터를 많이 잡는 것이 된다.
 
// MARK: - Question Model
struct QuestionItem: Identifiable {
    let id = UUID()
    let text: String
    let emoji: String
    var isHidden: Bool = false
}

// MARK: - QuestionBank
struct QuestionBank {
    static let allCategories: [[QuestionItem]] = [
        foodQuestions, sportsQuestions, dailyQuestions, familyQuestions,
        studyQuestions, travelQuestions, movieQuestions, musicQuestions
    ]
    

    // MARK: - Food
    static let foodQuestions: [QuestionItem] = [
        .init(text: "요즘 가장 자주 먹는 음식은?", emoji: "🍽"),
        .init(text: "어릴 적 좋아했던 음식은?", emoji: "🍼"),
        .init(text: "가장 기억에 남는 식사는 언제였나요?", emoji: "🍲"),
        .init(text: "친구에게 추천하고 싶은 맛집은?", emoji: "🍜"),
        .init(text: "혼자 먹는 걸 즐기나요?", emoji: "🍱"),
        .init(text: "기분 좋을 때 찾는 음식은?", emoji: "🍕"),
        .init(text: "가장 싫어하는 음식은?", emoji: "🥦"),
        .init(text: "같이 요리해보고 싶은 사람은?", emoji: "👩‍🍳"),
        .init(text: "가족과의 식사에서 기억나는 순간은?", emoji: "👨‍👩‍👧‍👦"),
        .init(text: "음식으로 표현되는 당신의 감정은?", emoji: "🌶"),
        .init(text: "마지막 식사로 먹고 싶은 음식은?", emoji: "🍛"),
        .init(text: "해외에서 맛본 음식 중 가장 특별했던 것은?", emoji: "🗺"),
        .init(text: "요즘 빠져있는 간식은?", emoji: "🍩"),
        .init(text: "음식과 관련된 추억이 있다면?", emoji: "🎞"),
        .init(text: "먹는 것보다 요리하는 걸 좋아하나요?", emoji: "🥘"),
        .init(text: "음식 취향이 잘 맞는 사람은 누구인가요?", emoji: "👯")
    ]

    // MARK: - Sports
    static let sportsQuestions: [QuestionItem] = [
        .init(text: "가장 좋아하는 운동은 무엇인가요?", emoji: "⚽️"),
        .init(text: "요즘 해보고 싶은 운동은?", emoji: "🏋️‍♂️"),
        .init(text: "팀 스포츠와 개인 스포츠 중 선호하는 것은?", emoji: "🤾"),
        .init(text: "어릴 적 가장 많이 했던 놀이는?", emoji: "🛝"),
        .init(text: "운동하며 들었던 음악은?", emoji: "🎧"),
        .init(text: "운동 후 가장 기분 좋았던 순간은?", emoji: "🏆"),
        .init(text: "함께 운동하고 싶은 사람은?", emoji: "👯‍♂️"),
        .init(text: "운동하며 배운 인생 교훈은?", emoji: "🧠"),
        .init(text: "스포츠 관람을 좋아하나요?", emoji: "📺"),
        .init(text: "가장 인상 깊었던 운동 경기?", emoji: "🥇"),
        .init(text: "운동을 통해 이루고 싶은 목표는?", emoji: "🎯"),
        .init(text: "스포츠와 감정을 연결한다면?", emoji: "💪"),
        .init(text: "운동으로 기분 전환이 되나요?", emoji: "☀️"),
        .init(text: "운동화나 운동복에 취향이 있나요?", emoji: "👟"),
        .init(text: "가장 좋아하는 스포츠 스타는?", emoji: "🌟"),
        .init(text: "운동을 통해 얻은 가장 좋은 변화는?", emoji: "🧘")
    ]

    // MARK: - Daily
    static let dailyQuestions: [QuestionItem] = [
        .init(text: "오늘 하루 중 가장 좋았던 순간은?", emoji: "☀️"),
        .init(text: "하루 중 가장 집중되는 시간대는?", emoji: "🕐"),
        .init(text: "일상의 루틴 중 가장 좋아하는 건?", emoji: "🧼"),
        .init(text: "최근 바뀐 습관이 있나요?", emoji: "🔁"),
        .init(text: "잠들기 전에 주로 하는 생각은?", emoji: "🌙"),
        .init(text: "아침에 일어나자마자 하는 일은?", emoji: "⏰"),
        .init(text: "일상을 기록하는 방법이 있나요?", emoji: "📓"),
        .init(text: "일상 속 감사한 일 한 가지는?", emoji: "🙏"),
        .init(text: "지금 내 책상 위에는 무엇이 있나요?", emoji: "🖥"),
        .init(text: "일상에서 감정을 조절하는 방법은?", emoji: "🧘"),
        .init(text: "오늘 기분을 색으로 표현한다면?", emoji: "🎨"),
        .init(text: "요즘 나를 웃게 하는 건 무엇인가요?", emoji: "😄"),
        .init(text: "일상 속에서 영감을 받는 순간은?", emoji: "💡"),
        .init(text: "집에서 가장 좋아하는 공간은?", emoji: "🏠"),
        .init(text: "나만의 힐링 루틴이 있다면?", emoji: "🌿"),
        .init(text: "일상에서 놓치고 있는 것 한 가지는?", emoji: "🔍")
    ]

    // MARK: - Family
    static let familyQuestions: [QuestionItem] = [
        .init(text: "가족과 함께한 가장 행복했던 순간은?", emoji: "👨‍👩‍👧‍👦"),
        .init(text: "어릴 적 가족과의 추억 한 가지는?", emoji: "🧸"),
        .init(text: "부모님께 감사한 점은?", emoji: "🙏"),
        .init(text: "요즘 가족과 어떤 대화를 나누었나요?", emoji: "💬"),
        .init(text: "가장 많이 닮은 가족은 누구인가요?", emoji: "🪞"),
        .init(text: "마음 속 깊이 전하고 싶은 말은?", emoji: "💌"),
        .init(text: "가족에게 바라는 점은?", emoji: "🎯"),
        .init(text: "가족과의 약속 중 지키고 싶은 한 가지는?", emoji: "🤝"),
        .init(text: "가족을 생각하면 떠오르는 단어는?", emoji: "🫶"),
        .init(text: "가족과의 오해가 있었던 적이 있다면?", emoji: "😶"),
        .init(text: "가족과 함께 이루고 싶은 일은?", emoji: "🏡"),
        .init(text: "내가 먼저 가족에게 표현한 적은?", emoji: "🗣️"),
        .init(text: "가족에게 감동 받은 순간은?", emoji: "🥹"),
        .init(text: "서로 가장 잘 맞는 가족 구성원은?", emoji: "💞"),
        .init(text: "가족과 나눈 대화 중 가장 기억에 남는 것은?", emoji: "📖"),
        .init(text: "가족이 나를 어떤 사람으로 기억했으면 좋겠나요?", emoji: "🧠")
    ]

    // MARK: - Study
    static let studyQuestions: [QuestionItem] = [
        .init(text: "최근 가장 몰입했던 공부는?", emoji: "📖"),
        .init(text: "나만의 공부법이 있다면?", emoji: "🧠"),
        .init(text: "공부가 잘 되는 장소는?", emoji: "📚"),
        .init(text: "지금 배우고 싶은 것은?", emoji: "💡"),
        .init(text: "공부하면서 힘들었던 순간은?", emoji: "😮‍💨"),
        .init(text: "좋아했던 과목과 그 이유는?", emoji: "📐"),
        .init(text: "싫어했던 과목은 왜 그랬나요?", emoji: "🧪"),
        .init(text: "공부하며 성장한 점은?", emoji: "🌱"),
        .init(text: "혼자 공부와 함께 공부 중 어떤 걸 선호하나요?", emoji: "👥"),
        .init(text: "공부를 통해 이루고 싶은 목표는?", emoji: "🎯"),
        .init(text: "공부 중 가장 기억에 남는 순간은?", emoji: "💭"),
        .init(text: "나에게 공부란 어떤 의미인가요?", emoji: "❓"),
        .init(text: "시험 전 긴장될 때 어떻게 하나요?", emoji: "😬"),
        .init(text: "공부를 방해하는 가장 큰 요소는?", emoji: "📱"),
        .init(text: "공부에 도움 되는 나만의 아이템은?", emoji: "🖊️"),
        .init(text: "지금 가장 궁금한 지식은?", emoji: "🔍")
    ]

    // MARK: - Travel
    static let travelQuestions: [QuestionItem] = [
        .init(text: "가장 기억에 남는 여행지는?", emoji: "🗺"),
        .init(text: "혼자 떠난 여행이 있다면?", emoji: "🧳"),
        .init(text: "여행 가기 전 꼭 챙기는 것은?", emoji: "📸"),
        .init(text: "여행 중 가장 뜻밖의 사건은?", emoji: "🎢"),
        .init(text: "가고 싶은 해외 도시는?", emoji: "🗼"),
        .init(text: "여행에서 만난 인상 깊은 사람은?", emoji: "🤝"),
        .init(text: "여행하면서 배운 삶의 지혜는?", emoji: "🌍"),
        .init(text: "여행지에서 즐겨먹은 음식은?", emoji: "🍜"),
        .init(text: "여행 중 가장 설렜던 순간은?", emoji: "💓"),
        .init(text: "다시 가고 싶은 여행지가 있다면?", emoji: "🧭"),
        .init(text: "여행 중의 나를 한 단어로 표현한다면?", emoji: "💫"),
        .init(text: "여행지에서 찍은 가장 소중한 사진은?", emoji: "📷"),
        .init(text: "자연과 함께한 여행은 어떤 느낌이었나요?", emoji: "🏞"),
        .init(text: "가장 많이 걷고 피곤했던 여행지는?", emoji: "🥾"),
        .init(text: "여행 중 감동받은 순간은?", emoji: "🥹"),
        .init(text: "여행에서 마주한 나만의 변화는?", emoji: "🧭")
    ]

    // MARK: - Movie
    static let movieQuestions: [QuestionItem] = [
        .init(text: "가장 감동 깊게 본 영화는?", emoji: "🎬"),
        .init(text: "다시 보고 싶은 영화가 있다면?", emoji: "🔁"),
        .init(text: "영화 보며 울어본 적 있나요?", emoji: "😢"),
        .init(text: "가장 인상 깊었던 영화 대사는?", emoji: "🎞"),
        .init(text: "좋아하는 영화 장르는?", emoji: "🎥"),
        .init(text: "최근 본 영화 중 추천하고 싶은 작품은?", emoji: "⭐️"),
        .init(text: "어릴 적 기억나는 첫 영화는?", emoji: "🧒"),
        .init(text: "영화관에서 본 최고의 장면은?", emoji: "🍿"),
        .init(text: "영화 속 등장인물 중 닮고 싶은 캐릭터는?", emoji: "🦸‍♂️"),
        .init(text: "현실 같았던 영화는?", emoji: "📽"),
        .init(text: "OST가 가장 좋았던 영화는?", emoji: "🎶"),
        .init(text: "친구와 함께 본 가장 재미있던 영화는?", emoji: "😂"),
        .init(text: "한 번 보고 이해 안 된 영화는?", emoji: "🌀"),
        .init(text: "공포영화를 좋아하시나요?", emoji: "👻"),
        .init(text: "감정이 뒤흔들린 영화는?", emoji: "💔"),
        .init(text: "지금 당장 보고 싶은 영화는?", emoji: "🎞️")
    ]

    // MARK: - Music
    static let musicQuestions: [QuestionItem] = [
        .init(text: "요즘 자주 듣는 노래는?", emoji: "🎧"),
        .init(text: "가장 좋아하는 가수는?", emoji: "🎤"),
        .init(text: "인생곡이라고 부를 수 있는 곡은?", emoji: "🎼"),
        .init(text: "기분 전환할 때 듣는 노래는?", emoji: "😊"),
        .init(text: "첫사랑을 떠올리게 하는 노래는?", emoji: "💘"),
        .init(text: "가사를 외울 정도로 좋아하는 곡은?", emoji: "📝"),
        .init(text: "슬플 때 듣는 음악은?", emoji: "😭"),
        .init(text: "음악과 관련된 추억이 있다면?", emoji: "💿"),
        .init(text: "나를 춤추게 하는 음악은?", emoji: "🕺"),
        .init(text: "좋아하는 악기 소리는?", emoji: "🎹"),
        .init(text: "음악이 없으면 상상할 수 없는 순간은?", emoji: "🎶"),
        .init(text: "감정이 담긴 플레이리스트 이름은?", emoji: "📀"),
        .init(text: "좋아하는 공연이나 페스티벌은?", emoji: "🎉"),
        .init(text: "음악을 통해 치유받은 경험이 있나요?", emoji: "💗"),
        .init(text: "나만 알고 싶은 아티스트는?", emoji: "🕵️"),
        .init(text: "언제 음악이 가장 절실했나요?", emoji: "🧠")
    ]
}
