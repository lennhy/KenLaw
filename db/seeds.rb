# Add seed data here. Seed your database with `rake db:seed`
jackson = User.create(username: "jackman", email:"jack@gmail.com", password:"kack034")
rakeem = User.create(username: "rakeem", email:"roy@gmail.com", password:"roy034")
Question.create(content: "police arrests me without my consent.")
Question.create(content: "I have been in jail without a trial for over 2 months.")
Question.create(content: "I want to protest against the government but I am afraid that I will get arrested.")

AMENDMENTS = {
               "The 1st Amendment" => "Congress shall make no law respecting an establishment of religion, or prohibiting the free exercise thereof;
                                       or abridging the freedom of speech, or of the press; or the right of the people, peaceably to assemble, and
                                       to petition the Government for a redress of grievances.",

               "The 2nd Amendment" => "A well regulated Militia, being necessary to the security of a free State, the right of the people to
                                       keep and bear Arms, shall not be infringed.",

               "The 3rd Amendment" => "No Soldier shall, in time of peace be quartered in any house, without the consent of the Owner,
                                       nor in time of war, but in a manner to be prescribed by law.",

               "The 4th Amendment" => "The right of the people to be secure in their persons, houses, papers, and effects, against unreasonable
                                       searches and seizures, shall not be violated, and no Warrants shall issue, but upon probable cause, supported by Oath or affirmation, and particularly describing the place to be searched, and the persons or things to be seized.",

               "The 5th Amendment" => "No person shall be held to answer for a capital, or otherwise infamous crime, unless on a presentment or
                                       indictment of Grand Jury, except in cases arising in the land or naval forces, or in the Militia, when in actual service in time of War or public danger; nor shall any person be subject for the same offence to be twice put in jeopardy of life or limb; nor shall be compelled in any criminal case to be a witness against himself, nor be deprived of life, liberty, or property, without due process of law; nor shall private property be taken for public use, without just compensation.",

              "The 6th Amendment" => "In all criminal prosecutions, the accused shall enjoy the right to a speedy and public trial, by an impartial jury of the
                                      State and district wherein the crime shall have been committed, which district shall have been previously ascertained by law, and to be informed of the nature and cause of the accusation; to be confronted with the witnesses against him; to have compulsory process for obtaining witnesses in his favor, and to have the Assistance of Counsel for his defence.",

              "The 7th Amendment" => "In Suits at common law, where the value in controversy shall exceed twenty dollars, the right of trial by jury shall be
                                      preserved, and no fact tried by a jury, shall be otherwise re-examined in any Court of the United States, than according to the rules of the common law.",

              "The 8th Amendment" => "Excessive bail shall not be required, nor excessive fines imposed, nor cruel and unusual punishments inflicted.",

              "The 9th Amendment" => "The enumeration in the Constitution, of certain rights, shall not be construed to deny or
                                      disparage others retained by the people.",

              "The 10th Amendment" => "The powers not delegated to the United States by the Constitution, nor prohibited by it to the States,
                                       are reserved to the States respectively, or to the people.",

              "The 11th Amendment" => "The Judicial power of the United States shall not be construed to extend to any suit in law or equity, commenced
                                      or prosecuted against one on the United States by Citizens of another State, or by Citizens or Subjects of any Foreign State.",

              "The 12th Amendment" => "Electors will vote for President and Vice President on separate ballots. (1804)",

              "The 13th Amendment" => "Neither slavery nor involuntary servitude, except as a punishment for crime whereof the party shall have been duly
                                      convicted, shall exist within the United States, or any place subject to their jurisdiction. SECTION 2. Congress shall have power to enforce this article by appropriate legislation.",

              "The 14th Amendment" => "All persons born or naturalized in the United States and subject to the jurisdiction thereof, are citizens of the
                                       United States and of the State wherein they reside. No State shall make or enforce any law which shall abridge the privileges or immunities of citizens of the United States; nor shall any State deprive any person of life, liberty, or property, without due process of law; nor deny to any person within its jurisdiction the equal protection of the laws.",

              "The 15th Amendment" => "The right of citizens of the United States to vote shall not be denied or abridged by the United States
                                       or by any State on account of race,color, or previous condition of servitude."
      }

# --seed the databse with amendment objects
Amendment.seed_databse(AMENDMENTS)
