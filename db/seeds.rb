# Add seed data here. Seed your database with `rake db:seed`
AMENDMENTS = {
                   "The 1st Amendment - Freedom of Religion, Press, Expression" => "Congress shall make no law respecting an establishment of religion, or prohibiting the free exercise thereof;
                                        or abridging the freedom of speech, or of the press; or the right of the people, peaceably to assemble, and
                                        to petition the Government for a redress of grievances.",

                   "The 2nd Amendment - Right to Bear Arms" => "A well regulated Militia, being necessary to the security of a free State, the right of the people to
                                        keep and bear Arms, shall not be infringed",

                   "The 3rd Amendment - Quartering of Soldiers." => "No Soldier shall, in time of peace be quartered in any house, without the consent of the Owner,
                                        nor in time of war, but in a manner to be prescribed by law",

                   "The 4th Amendment - Search and Seizure" => "The right of the people to be secure in their persons, houses, papers, and effects, against unreasonable
                                        searches and seizures, shall not be violated, and no Warrants shall issue, but upon probable cause, supported by Oath or affirmation, and particularly describing the place to be searched, and the persons or things to be seized.",

                   "The 5th Amendment - Trial and Punishment, Compensation for Takings" => "No person shall be held to answer for a capital, or otherwise infamous crime, unless on a presentment or
                                        indictment of Grand Jury, except in cases arising in the land or naval forces, or in the Militia, when in actual service in time of War or public danger; nor shall any person be subject for the same offence to be twice put in jeopardy of life or limb; nor shall be compelled in any criminal case to be a witness against himself, nor be deprived of life, liberty, or property, without due process of law; nor shall private property be taken for public use, without just compensation.",

                   "The 6th Amendment - Right to Speedy and fair Trial, Confrontation of Witnesses" => "In all criminal prosecutions, the accused shall enjoy the right to a speedy and public trial, by an impartial jury of the
                                        State and district wherein the crime shall have been committed, which district shall have been previously ascertained by law, and to be informed of the nature and cause of the accusation; to be confronted with the witnesses against him; to have compulsory process for obtaining witnesses in his favor, and to have the Assistance of Counsel for his defence.",

                   "The 7th Amendment - Trial by Jury in Civil Cases" => "In Suits at common law, where the value in controversy shall exceed twenty dollars, the right of trial by jury shall be
                                        preserved, and no fact tried by a jury, shall be otherwise re-examined in any Court of the United States, than according to the rules of the common law.",

                   "The 8th Amendment - Cruel and Unusual Punishment" => "Excessive bail shall not be required, nor excessive fines imposed, nor cruel and unusual punishments inflicted.",

                   "The 9th Amendment - Construction of Constitution" => "The enumeration in the Constitution, of certain rights, shall not be construed to deny or
                                        disparage others retained by the people.",

                  "The 10th Amendment - Powers of the States and People" => "The powers not delegated to the United States by the Constitution, nor prohibited by it to the States,
                                        are reserved to the States respectively, or to the people.",

                  "The 11th Amendment - Judicial Limits" => "The Judicial power of the United States shall not be construed to extend to any suit in law or equity, commenced
                                        or prosecuted against one on the United States by Citizens of another State, or by Citizens or Subjects of any Foreign State.",

                  "The 12th Amendment - Choosing the President, Vice-President" => "Electors will vote for President and Vice President on separate ballots. (1804)",

                  "The 13th Amendment - Slavery Abolished" => "Neither slavery nor involuntary servitude, except as a punishment for crime whereof the party shall have been duly
                                        convicted, shall exist within the United States, or any place subject to their jurisdiction. SECTION 2. Congress shall have power to enforce this article by appropriate legislation.",

                  "The 14th Amendment - Citizenship Rights" => "All persons born or naturalized in the United States and subject to the jurisdiction thereof, are citizens of the
                                        United States and of the State wherein they reside. No State shall make or enforce any law which shall abridge the
                                        privileges or immunities of citizens of the United States; nor shall any State deprive any person of life, liberty,
                                        or property, without due process of law; nor deny to any person within its jurisdiction the equal protection of
                                        the laws.",

                  "The 15th Amendment - Race No Bar to Vote" => "The right of citizens of the United States to vote shall not be denied or abridged by the United States
                                        or by any State on account of race,color, or previous condition of servitude. The Congress shall have power to enforce this article by appropriate legislation.",

                  "The 16th Amendment - Status of Income Tax Clarified" =>  "The Congress shall have power to lay and collect taxes on incomes, from whatever
                                        source derived, without apportionment among the several States, and without regard to
                                        any census or enumeration.",

                  "The 17th Amendment - Senators Elected by Popular Vote " =>  "The Senate of the United States shall be composed of two Senators from each State,
                                        elected by the people thereof, for six years; and each Senator shall have one vote. The
                                        electors in each State shall have the qualifications requisite for electors of the most
                                        numerous branch of the State legislatures.
                                        When vacancies happen in the representation of any State in the Senate, the executive
                                        authority of such State shall issue writs of election to fill such vacancies: Provided, That
                                        the legislature of any State may empower the executive thereof to make temporary
                                        appointments until the people fill the vacancies by election as the legislature may direct.
                                        This amendment shall not be so construed as to affect the election or term of any Senator
                                        chosen before it becomes valid as part of the Constitution. ",

                  "The 18th Amendment  - Liquor Abolished" =>  "Liquor Abolished. Ratified 1/16/1919. Repealed by Amendment 21,
                                        12/5/1933.",

                  "The 19th Amendment - Women's Suffrage" =>  "The right of citizens of the United States to vote shall not be denied or abridged by the
                                        United States or by any State on account of sex.
                                        Congress shall have power to enforce this article by appropriate legislation. ",

                  "The 20th Amendment - Presidential, Congressional Terms" =>  "1. The terms of the President and Vice President shall end at noon on the 20th day of
                                        January, and the terms of Senators and Representatives at noon on the 3d day of January,
                                        of the years in which such terms would have ended if this article had not been ratified;
                                        and the terms of their successors shall then begin.
                                        2. The Congress shall assemble at least once in every year, and such meeting shall begin
                                        at noon on the 3d day of January, unless they shall by law appoint a different day.
                                        3. If, at the time fixed for the beginning of the term of the President, the President elect
                                        shall have died, the Vice President elect shall become President. If a President shall not
                                        have been chosen before the time fixed for the beginning of his term, or if the President
                                        elect shall have failed to qualify, then the Vice President elect shall act as President until
                                        a President shall have qualified; and the Congress may by law provide for the case
                                        wherein neither a President elect nor a Vice President elect shall have qualified, declaring
                                        who shall then act as President, or the manner in which one who is to act shall be
                                        selected, and such person shall act accordingly until a President or Vice President shall
                                        have qualified.
                                        4. The Congress may by law provide for the case of the death of any of the persons from
                                        whom the House of Representatives may choose a President whenever the right of choice
                                        shall have devolved upon them, and for the case of the death of any of the persons from
                                        whom the Senate may choose a Vice President whenever the right of choice shall have
                                        devolved upon them.
                                        5. Sections 1 and 2 shall take effect on the 15th day of October following the ratification
                                        of this article.
                                        6. This article shall be inoperative unless it shall have been ratified as an amendment to
                                        the Constitution by the legislatures of three-fourths of the several States within seven
                                        years from the date of its submission. ",

                  "The 21st Amendment - Amendment 18 Repealed" =>  "Amendment 18 Repealed. Ratified 12/5/1933.",

                  "The 22nd Amendment - Presidential Term Limits" =>  "No person shall be elected to the office of the President more than twice, and no person
                                        who has held the office of President, or acted as President, for more than two years of a
                                        term to which some other person was elected President shall be elected to the office of
                                        the President more than once. But this Article shall not apply to any person holding the
                                        office of President, when this Article was proposed by the Congress, and shall not
                                        prevent any person who may be holding the office of President, or acting as President,
                                        during the term within which this Article becomes operative from holding the office of
                                        President or acting as President during the remainder of such term.
                                        This article shall be inoperative unless it shall have been ratified as an amendment to
                                        the Constitution by the legislatures of three-fourths of the several States within seven
                                        years from the date of its submission to the States by the Congress. ",

                  "The 23rd Amendment - Presidential Vote for District of Columbia" =>  "The District constituting the seat of Government of the United States shall appoint in
                                        such manner as the Congress may direct: A number of electors of President and Vice
                                        President equal to the whole number of Senators and Representatives in Congress to
                                        which the District would be entitled if it were a State, but in no event more than the least
                                        populous State; they shall be in addition to those appointed by the States, but they shall
                                        be considered, for the purposes of the election of President and Vice President, to be
                                        electors appointed by a State; and they shall meet in the District and perform such duties
                                        as provided by the twelfth article of amendment.
                                        The Congress shall have power to enforce this article by appropriate legislation. ",

                  "The 24th Amendment - Poll Tax Barred" =>  "The right of citizens of the United States to vote in any primary or other election for
                                        President or Vice President, for electors for President or Vice President, or for Senator or
                                        Representative in Congress, shall not be denied or abridged by the United States or any
                                        State by reason of failure to pay any poll tax or other tax.
                                        The Congress shall have power to enforce this article by appropriate legislation.",

                  "The 25th Amendment - Presidential Disability and Succession" =>  "1. In case of the removal of the President from office or of his death or resignation, the
                                        Vice President shall become President.
                                        2. Whenever there is a vacancy in the office of the Vice President, the President shall
                                        nominate a Vice President who shall take office upon confirmation by a majority vote of
                                        both Houses of Congress.
                                        3. Whenever the President transmits to the President pro tempore of the Senate and the
                                        Speaker of the House of Representatives his written declaration that he is unable to
                                        discharge the powers and duties of his office, and until he transmits to them a written
                                        declaration to the contrary, such powers and duties shall be discharged by the Vice
                                        President as Acting President.
                                        4. Whenever the Vice President and a majority of either the principal officers of the
                                        executive departments or of such other body as Congress may by law provide, transmit to
                                        the President pro tempore of the Senate and the Speaker of the House of Representatives
                                        their written declaration that the President is unable to discharge the powers and duties of
                                        his office, the Vice President shall immediately assume the powers and duties of the
                                        office as Acting President.
                                        Thereafter, when the President transmits to the President pro tempore of the Senate and
                                        the Speaker of the House of Representatives his written declaration that no inability
                                        exists, he shall resume the powers and duties of his office unless the Vice President and a
                                        majority of either the principal officers of the executive department or of such other body
                                        as Congress may by law provide, transmit within four days to the President pro tempore
                                        of the Senate and the Speaker of the House of Representatives their written declaration
                                        that the President is unable to discharge the powers and duties of his office. Thereupon
                                        Congress shall decide the issue, assembling within forty eight hours for that purpose if
                                        not in session. If the Congress, within twenty one days after receipt of the latter written
                                        declaration, or, if Congress is not in session, within twenty one days after Congress is
                                        required to assemble, determines by two thirds vote of both Houses that the President is
                                        unable to discharge the powers and duties of his office, the Vice President shall continue
                                        to discharge the same as Acting President; otherwise, the President shall resume the
                                        powers and duties of his office. ",

                  "The 26th Amendment - Voting Age Set to 18 Years" =>  "The right of citizens of the United States, who are eighteen years of age or older, to
                                        vote shall not be denied or abridged by the United States or by any State on account of
                                        age.
                                        The Congress shall have power to enforce this article by appropriate legislation. ",

                  "The 27th Amendment - Limiting Congressional Pay Increases" =>  "No law, varying the compensation for the services of the Senators and Representatives,
                                        shall take effect, until an election of Representatives shall have intervened."
      }

# --seed the databse with amendment objects
Amendment.seed_databse(AMENDMENTS)
