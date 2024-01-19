import SwiftUI


struct Section: Codable, Identifiable, Equatable {
    var id =  UUID()
    var imageName: String
    var title: String
    var blurb: String
    var items: [SectionItem]
}
struct SectionItem: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var level: String
    
}

struct School: Codable, Identifiable, Equatable {
    var id = UUID()
    var name: String
    var notes: String = ""
    var leaderShipSections = [
        Section(imageName: "person.3.fill", title: "Establish an innovation team.", blurb: "A team of influencers and innovators help map out and implement your vision and keep the community engaged.", items: [
            SectionItem(title: "We've created an innovation team.", level: "none"),
            SectionItem(title: "We've established our roles and tasks.", level: "none"),
            SectionItem(title: "We meet regulary.", level: "none")
        ]),
        Section(imageName: "eye", title: "Develop a shared vision.", blurb: "Your vision is an idea—expressed in a sentence or two—that articulates and helps you communicate your aspirations for learning, teaching, and the learning environment.", items: [
            SectionItem(title: "We set priorities for learning, teaching, and teh learning environment.", level: "none"),
            SectionItem(title: "We align and refine our vision with our organization's priorities.", level: "none"),
            SectionItem(title: "We've developed a community engagement plan to sustain the vision.", level: "none"),
            SectionItem(title: "We communicate our vision.", level: "none")
        ]),
        Section(imageName: "heart.fill", title: "Define your culture.", blurb: "Culture influences every aspect of your organization. It shapes the way your faculty, staff, students, and community interact with each other, and what they expect of you as a leader.", items: [
            SectionItem(title: "We've identified values, common beliefs, practices, and future goals with stakeholders.", level: "none"),
            SectionItem(title: "We align our vision to our culture.", level: "none"),
            SectionItem(title: "We promote a positive culture of learning.", level: "none")
        ]),
        Section(imageName: "checkmark.circle.fill", title: "Set goals.", blurb: "Identifying your goals and how to measure progress toward them helps you share successes and identify areas to improve.", items: [
            SectionItem(title: "We've identified out learning goals.", level: "none"),
            SectionItem(title: "We collect qualitative and quantitative evidence.", level: "none"),
            SectionItem(title: "We analyze data to inform areas for growth and development.", level: "none"),
            SectionItem(title: "We communicate progress with stakeholders and the community.", level: "none")
        ]),
        Section(imageName: "chart.bar.fill", title: "Build capactiy.", blurb: "Assess the growth potential of your organization before you adopt, implement, and expand new practices.\n\nWhen leaders are proactive about building capacity, the entire community feels prepared to implement change.", items: [
            SectionItem(title: "We invest and see the value in building capactiy.", level: "none"),
            SectionItem(title: "We build experience and skills for our faculty over time.", level: "none"),
            SectionItem(title: "We provide resources to grow our initiative.", level: "none")
        ]),
        Section(imageName: "graduationcap.fill", title: "Create a professional learning plan.", blurb: "Organizations that prioritize ongoing professional learning provide a range of opportunities for educators to learn both independently and collaboratively.", items: [
            SectionItem(title: "We've identified professional learning styles and needs.", level: "none"),
            SectionItem(title: "We offer voice and choice in professional learning opportunities.", level: "none"),
            SectionItem(title: "We create opportunities for ongoing feedback and coaching.", level: "none"),
            SectionItem(title: "We allow faculty members to share their knowledge and mastery with each other.", level: "none")
        ])
    ]
    
    var educatorSections = [
        Section(imageName: "sparkles", title: "Stay curious and connected.", blurb: "When organizations prioritize professional learning with technoloy, they're able to raise the bar for what's possible in classrooms and beyond.\n\nAs an educator you can engasge in meaningful professional learning opportunities both independently and collaboratively.", items: [
            SectionItem(title: "We build teaching and technology skills through professional learning.", level: "none"),
            SectionItem(title: "We collaborate with colleagues and leaders in cycles of feedback.", level: "none"),
            SectionItem(title: "We share knowledge and mastery of skills with other faculty members.", level: "none")
        ]),
        Section(imageName: "person.fill.viewfinder", title: "Personalize learning.", blurb: "Technology supports educators in developing and managing activities, guidance, content, and learning experiences for each student's ability and learning level.\n\nPersonalizing learning opportunities enable students to pursue unique paths.", items: [
            SectionItem(title: "We design accessible learning experiecnes.", level: "none"),
            SectionItem(title: "We create learning opportunitiers for different learning styles and diverse learning needs.", level: "none"),
            SectionItem(title: "We support remote, hybrid, or blended learning.", level: "none"),
            SectionItem(title: "We offer voice and choice in assignments.", level: "none")
        ]),
        Section(imageName: "bubble.left.and.bubble.right.fill", title: "Foster communication and creation.", blurb: "Learning can be enhanced when students are asked to create products that express what they know or think.\n\nIn particular, it's the combination of communication and creation that can make these activites more meaningful to learners.", items: [
            SectionItem(title: "We allow students to create products to show what they know or think.", level: "none"),
            SectionItem(title: "We encourage use of professional tools to build communication skills.", level: "none"),
            SectionItem(title: "We ensure that students communicate to a specific external audience.", level: "none")
        ]),
        Section(imageName: "person.3.fill", title: "Promote teamwork.", blurb: "When students work together in meaningful ways, they are collectively addressing and resolving important issues, considering alternatives, building consensus, and working with shared purpose.", items: [
            SectionItem(title: "We build collaborative experiences.", level: "none"),
            SectionItem(title: "We ensure that students create shared products and engage in joint reasoning.", level: "none"),
            SectionItem(title: "We model and promote digital citizenship.", level: "none")
        ]),
        Section(imageName: "brain.head.profile", title: "Elevate critical thinking.", blurb: "Technology offers posssibilies for all aspects of the critical-thinking process, helping students to work through problems, develop solutions, and make meaning from their experiences.", items: [
            SectionItem(title: "We design learning experiences that engage students in analysis, interpretation, synthesis, evaluaiton, or solution generation.", level: "none"),
            SectionItem(title: "We create activities that promote intellectual independence.", level: "none")
        ]),
        Section(imageName: "globe.americas.fill", title: "Support real-world engagement.", blurb: "Technology makes it possible to bring the real world into the classroom, and make the classroom funciton as part of the real world.", items: [
            SectionItem(title: "We provide context in academic content with realistic examples.", level: "none"),
            SectionItem(title: "We create learning experiences that immerse students in real-world settings.", level: "none"),
            SectionItem(title: "We ensure that assignments contain realistic tasks.", level: "none")
        ]),
        Section(imageName: "chart.pie.fill", title: "Use research and data.", blurb: "Institutions that incorporate research into their culture of professional learning become more confident in their decisions and celebrate success with data-rich stories they share with their communities and the world.", items: [
            SectionItem(title: "We provide formative and summative assessments.", level: "none"),
            SectionItem(title: "We consider alternative assessment opportunities.", level: "none"),
            SectionItem(title: "We use research to support effective teaching practices.", level: "none"),
            SectionItem(title: "We engage in action research.", level: "none")
        ])
    ]
    
    var itSections = [
        Section(imageName: "eye.fill", title: "Integrate IT into your shared vision.", blurb: "Successful deployments include a diverse team of leadership stakeholders.\n\nThis ensures that technology integration isn't just an IT or academic initiative-it's a holistic plan based on a common vision.", items: [
            SectionItem(title: "We include IT staff members in academic meetings.", level: "none"),
            SectionItem(title: "We work with instructional technologists who bridge the gap between IT and academics.", level: "none")
        ]),
        Section(imageName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left", title: "Revitalixe your infrastructure.", blurb: "Education organizations need tools, resources, and systems that help IT administrators, leaders, and educators manage a technology-rich environment.\n\nInnovative IT departments design the infrastructure to provide new opportunities and inspire the learning community.", items: [
            SectionItem(title: "We maintain a robust wireless network designed to meet coverage, capacity, and learner needs.", level: "none"),
            SectionItem(title: "We streamline our user login experience by implementing cross-compatible systems.", level: "none"),
            SectionItem(title: "We've built a culture that values learner-centric privacy.", level: "none")
        ]),
        
        Section(imageName: "display.2", title: "Design a device experience.", blurb: "Work as a team with management tools to automate and streamline workflows that help personlize the device experience.", items: [
            SectionItem(title: "We craft a seamliess device setup prodecure.", level: "none"),
            SectionItem(title: "We offer a curated app catalog.", level: "none"),
            SectionItem(title: "We manage device settings to ensure appropriate content.", level: "none")
        ]),
        Section(imageName: "books.vertical.fill", title: "Empower educators.", blurb: "Educators are more successful when they're able to address the individual needs of learners while keeping the rest of the class on-task.\n\nMany centralized learning solutions give educators the ability to solve common issues independently.", items: [
            SectionItem(title: "We enable teacher to guide learning and monitor in-class activity.", level: "none"),
            SectionItem(title: "We streamline digital workflows.", level: "none"),
            SectionItem(title: "We allow teachers to manage student accounts, classes, and devices.", level: "none")
        ]),
        Section(imageName: "graduationcap.fill", title: "Empower students.", blurb: "Physical and digital spaces provide a context for learning experiences. These spaces can inspire students to do creative work, focus on a specific task, collaborate, or work independently. And they can be designed to support the unqiue needs of every learners.", items: [
            SectionItem(title: "We've assembled physical and digital spaces that enable creativity, productivity, and cross-disclipline learning experiences.", level: "none"),
            SectionItem(title: "We implement solutions that enable communication, collaboration, and sharing.", level: "none")
        ])
    ]
}
